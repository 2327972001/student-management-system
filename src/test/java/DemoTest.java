import com.zym.bean.User;
import com.zym.dao.UserDao;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.Map;

public class DemoTest {
    @Test
    public void testSpringMybatisUser(){
        /*构建一个Spring容器*/
        /*ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/spring-context.xml");*/
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        /*从容器中获取Mapper*/
        UserDao userDao = applicationContext.getBean(UserDao.class);

        User user = new User();
        user.setName("小军");
        user.setUsername("456789");
        user.setPassword("456789");
        user.setSex('女');
        user.setSquad("1935");
//        userDao.UserByUpdate(user);
//        System.out.println(user);
//        System.out.println(userDao.UserByUpdate(user));

        System.out.println(userDao.UserByAdd(user));
    }
}
