SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `SystemEvents`;
CREATE TABLE `SystemEvents`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerID` bigint NULL DEFAULT NULL,
  `ReceivedAt` datetime NULL DEFAULT NULL,
  `DeviceReportedTime` datetime NULL DEFAULT NULL,
  `Facility` smallint NULL DEFAULT NULL,
  `Priority` smallint NULL DEFAULT NULL,
  `FromHost` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FromIP` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `NTSeverity` int NULL DEFAULT NULL,
  `Importance` int NULL DEFAULT NULL,
  `EventSource` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EventUser` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EventCategory` int NULL DEFAULT NULL,
  `EventID` int NULL DEFAULT NULL,
  `EventBinaryData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `MaxAvailable` int NULL DEFAULT NULL,
  `CurrUsage` int NULL DEFAULT NULL,
  `MinUsage` int NULL DEFAULT NULL,
  `MaxUsage` int NULL DEFAULT NULL,
  `InfoUnitID` int NULL DEFAULT NULL,
  `SysLogTag` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EventLogType` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `GenericFileName` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SystemID` int NULL DEFAULT NULL,
  `processid` int NULL DEFAULT NULL,
  `checksum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `SystemEventsProperties`;
CREATE TABLE `SystemEventsProperties`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `SystemEventID` int NULL DEFAULT NULL,
  `ParamName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ParamValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
