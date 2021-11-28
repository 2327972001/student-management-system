import com.zym.bean.User;
import com.zym.dao.UserDao;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DemoTest {
    @Test
    public void testSpringMybatisUser(){
        /*构建一个Spring容器*/
        /*ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/spring-context.xml");*/
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        /*从容器中获取Mapper*/
        UserDao userDao = applicationContext.getBean(UserDao.class);

//        User user = new User();
//        user.setSex('男');
////        userDao.UserByUpdate(user);
////        System.out.println(user);
////        System.out.println(userDao.UserByUpdate(user));
//        System.out.println(user);
//        List<User> userlist = userDao.UserByShow(user);
//        System.out.println(userlist);
        System.out.println(userDao.UserByDelete(5));
    }
}
