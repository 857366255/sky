import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Assert;
import org.junit.Test;

/**
 * Created by wz on 2018/2/27.
 */
public class PermissionTest {

    @Test(expected = UnauthorizedException.class)
    public void testCheckPermission () {
        Subject subject = login("classpath:shiro-permission.ini", "wang", "123");
        //断言拥有权限：user:create
        subject.checkPermission("user:create");
        //断言拥有权限：user:delete and user:update
        subject.checkPermissions("user:delete", "user:update");
        //断言拥有权限：user:view 失败抛出异常
        subject.checkPermissions("user:view");
    }
    @Test
    public void testIsPermitted() {
        Subject subject =login("classpath:shiro-permission.ini", "wang", "123");
        //判断拥有权限：user:create
        Assert.assertTrue(subject.isPermitted("user:create"));
        //判断拥有权限：user:update and user:delete
        //Assert.assertTrue(subject.isPermittedAll("user:update", "user:delete"));
        //判断没有权限：user:view
        Assert.assertFalse(subject.isPermitted("user:view"));
    }
    public static Subject login(String configFile, String username, String password){

        Factory<SecurityManager> factory = new IniSecurityManagerFactory(configFile);

        //2、得到SecurityManager实例 并绑定给SecurityUtils
        SecurityManager securityManager = factory.getInstance();
        SecurityUtils.setSecurityManager(securityManager);
        //3、得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）
        Subject subject = SecurityUtils.getSubject();
        // 创建Token令牌,用户名/密码
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 验证登录 会抛出异常
        try {
            subject.login(token);
            System.out.println("身份验证成功!!!");
        } catch (AuthenticationException e) {
            e.printStackTrace();
            System.out.println("身份验证失败!!!!");
        }
        return subject;
    }
}
