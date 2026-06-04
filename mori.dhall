let Schema =
      https://raw.githubusercontent.com/shinzui/mori-schema/026ae74331e5c516542af1dd96f041c658ed4621/package.dhall
        sha256:18258ef583580a897f4af3e7c86db0342afb42fb40efc535b217ba1089230141

in  Schema.Project.mk
      { project =
              Schema.ProjectIdentity.mk
                { name = "hasql-migration"
                , namespace = "shinzui"
                , type = Schema.PackageType.Library
                , language = Schema.Language.Haskell
                , lifecycle = Schema.Lifecycle.Active
                }
          //  { description = Some
                  "PostgreSQL schema migrations for hasql, tracking executed scripts by filename and MD5 checksum"
              , domains = [ "Database", "PostgreSQL" ]
              , owners = [ "shinzui" ]
              }
      }
    //  { repos =
          [     Schema.Repo.mk { name = "hasql-migration" }
            //  { github = Some "shinzui/hasql-migration"
                , localPath = Some "./"
                }
          ]
        , packages =
          [     Schema.Package.mk
                  { name = "hasql-migration"
                  , type = Schema.PackageType.Library
                  , language = Schema.Language.Haskell
                  }
            //  { path = Some "src"
                , description = Some "hasql schema migration library"
                , dependencies =
                  [ Schema.Dependency.ByName "hasql:hasql"
                  , Schema.Dependency.ByName "hasql:hasql-transaction"
                  , Schema.Dependency.ByName "crypton:crypton"
                  ]
                }
          ,     Schema.Package.mk
                  { name = "hasql-migration-test"
                  , type = Schema.PackageType.Other "TestSuite"
                  , language = Schema.Language.Haskell
                  }
            //  { path = Some "test"
                , description = Some "Test suite for hasql-migration"
                , visibility = Schema.Visibility.Private
                , dependencies = [ Schema.Dependency.ByName "hasql:hasql" ]
                }
          ]
        , dependencies = [ "hasql/hasql", "kazu-yamamoto/crypton" ]
        , docs =
          [     Schema.DocRef.mk
                  { key = "readme"
                  , kind = Schema.DocKind.Reference
                  , audience = Schema.DocAudience.User
                  , location = Schema.DocLocation.LocalFile "README.md"
                  }
            //  { description = Some "Project README" }
          ]
        }
