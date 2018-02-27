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

import java.util.Arrays;

/**
 * Created by wz on 2018/2/27.
 */
public class RoleTest {
    @Test(expected = UnauthorizedException.class)
    public void testCheckRole() {
        Subject subject = login("classpath:shiro-role.ini", "wang", "123");
        //断言拥有角色：role1
        subject.checkRole("role1");
        //断言拥有角色：role1 and role3 失败抛出异常
        subject.checkRoles("role1", "role3");
    }
    @Test
    public void testHasRole() {
        Subject subject = login("classpath:shiro-role.ini", "wang", "123");
        //判断拥有角色：role1
        Assert.assertTrue(subject.hasRole("role1"));
        //判断拥有角色：role1 and role2
        //Assert.assertTrue(subject.hasAllRoles(Arrays.asList("role1","role2")));
        //判断拥有角色：role1 and role2 and !role3
        boolean[] result = subject.hasRoles(Arrays.asList("role1", "role2", "role3"));
        Assert.assertEquals(true, result[0]);
        //Assert.assertEquals(true, result[1]);
        //Assert.assertEquals(false, result[2]);
    }

    public static Subject login(String configFile,String username, String password){

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
