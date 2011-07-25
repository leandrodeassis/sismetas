dataSource {
    pooled = true
	dbCreate = "update"
	url = "jdbc:mysql://192.168.1.250/sismetas"
    driverClassName = "com.mysql.jdbc.Driver"
    username = "sismetas"
    password = "sismetas@password"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}

/*dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}*/
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:devDB"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://mysql.cge.ifpb.edu.br/sismetas"
        }
    }
}
