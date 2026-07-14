Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C88C30674D
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049500; cv=none; b=MkaUtfhj9kU4HLgjLzkVJWK3duYzNwgeVgF8c7pVXCw80Eripks9m7KX/LSQuX78msgM99IB9SORlCo0ahNLXlRQgjHbp9BU9O+HKqmyDtzoD7vHukf4LyfdvcG3kYtYV4tAM18ItJgiJsEerqHl+jZ+SqtwyIiOUxO9S2p1MDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049500; c=relaxed/simple;
	bh=MfoLK8M+cwJsqJMcoFtwkeKu04gSS+o06svNL8s3zdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2MqJvq5Vz9qVhkCr2jg6hKo+pRe0wSmoguWFxPF1MczX4sx3FnxjnxOLQwW9Z6CYDAE8IDUmcIRUirDuIai+vSYA0yfAAGQ776Gr8XFUZCM0QUhTin/6fQOlUQ9YlZJ8HCfxLKF6Tilnob0KjX+K7Dbllw9w2V8NrBqRlxH8y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6xBjTjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAImRyx8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6xBjTjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAImRyx8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6wVJ1003557
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=; b=k6xBjTjjlCMFY+Eo
	3CjKPlAA3V0CWRFA3KF4IASSJ8C7Pz8GwNYnuoHyOk3kdGLwleJ3haABo7c8+H4D
	QnSfJNgDRtn/p9n0l0ZTMGVZ8eZ5HtARQwnnagmgX5xxwt6cD4Oql6LzFYb4caoq
	b3YaHlfRUUCt2d60seda6PPS9/tQbhfGQ6I2jND6A21umB2pZTegMv45orFEe4oi
	tXgpyK+v9fukW0o2On8ZXbsqPAnwHDXjolG7pDmso7eRMEOCGYDT7RcnuGUVscZ7
	q6T8Utl4V4Lk7Pug1zbUWhF/U98DdK50p8q8Jpb8wCybm15H7GLk1K0+0e37e7VH
	vxSBIg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr13je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so7989435b3a.1
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049496; x=1784654296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=;
        b=DAImRyx8U/okT5w2FQxRKUlKJHVGqk7aRcgQSDz1RA3nuOWamYrJrKTG3WXOz7PxDZ
         SkdKXMfdoalzwD+k/gjLhMwPhTFNwZ1tRXGbEMqr+iVbVzxYO3Wrl909V5laa8Yt8KS/
         WOn0Vm8/rqknHfnMoE05F2N/5qjm+HVQ/ocmVZMBgFCPcC3cRvG2BN8713aOnHqWo1zy
         bfAjUnxoN7+BptYzb6Ray86qfO9i66mqlMpg/FQC7jcgS+Obnv/hm/g08bvvMP5qTnJG
         Oia5G+QnNQ2ChnRtVxtYcltRiiq1auvwMPuLYsPrzr/Jd1YkH64oC9QXp71S+xoT3t0W
         Yp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049496; x=1784654296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=;
        b=rShFoKA+ZaEcc2BevSTV+88T70uzWW1tnmFec8lHj7x4pWQxdLSX+a0eg+Spt74PrA
         4a5SopH3X1p/yIIviIrY06eWrOmGhbHDVxlvX+pT22C5jyqnhHhhaYvQdfP8tUjjhhoP
         05NnujqMZEBsTdw+603dLdAZ2zMC/uxko63kxvPVGMnGxXOIr/nldMMycxoNtsS68bu3
         y/5lLFNKoXT3rGPLBAni0VkYl3KBvQwjdrWN13kNE+6u+rHXTUlrjO9rb2OcdR9GU5Vl
         0rwegrdHbJz+v2iiwiqORH/vCW81kIn27iMt64Ayyb90RD06fMGY50jXJ1qccZYN3C6s
         9KrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcGnr1QA3KhpdLxv5/S3iOIADz0pfnUC0SvFfx7P4rbHYx02UgTQ7eXLNSbMuxWcCxfj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmPs//rCrNLN4IkCFVtGkQQmZ2D1mlyOYy75DkixHSzd8WVzF/
	mrE64/2IXy0wDCRpDFKzFUqwsDzeSPcXOKwjl+lycJqMz7q28zlP8OdLJMuU0fY85oxMZBWERQm
	EXiEdtB7+5u4Y82pbsvAsYwZGBkISoF9R/dsREmA6ZR0PkTPqlb3uBAY=
X-Gm-Gg: AfdE7cmPydrrCQNlzWxQfsyvmKRFC2+Don6X0ATK161fcC3zYVJ2viIk3rLxpov4j0G
	QBU8p7Npjkmm5oFDJX+qCawdnm0GO28e8YYt+6CA4gvGGQLLxq+rcXIRhPW0YM0oiCBEBHn8LQl
	Baa+jL+VKZY/lfzIO1b9uyhjt/PCe+Cl4RCSftk0TFa8kjZ/rGqEA4z0FInwOlVLFxlPa7xNkKj
	MHBEg+BUixZupxMVVBk16NhCLUlfWsinxYlaSvHndjuvxY+m3/3NF6iDYvvuamwOiDLosvz+T2V
	7O5oP0ho4G3zWS7r6vVUNU2Z1NAOjiWJxTvUw+AgKtoZ1FCqC+ujr9LTIRP38kMwAeUnJSQv6Sw
	47K5s7HUKUMAUvhB24bMsFaDwTtZddNWj7gwg0c/5cwG5ygw=
X-Received: by 2002:a05:6a00:4405:b0:845:d286:1fa5 with SMTP id d2e1a72fcca58-8488974b096mr13460113b3a.52.1784049495851;
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4405:b0:845:d286:1fa5 with SMTP id d2e1a72fcca58-8488974b096mr13460058b3a.52.1784049495426;
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:37 +0530
Subject: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2622;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MfoLK8M+cwJsqJMcoFtwkeKu04gSS+o06svNL8s3zdQ=;
 b=qc68dV4YEQckF6aiIfbEhwnkSEuflVjvhtpo0b0PGXV9fx3UjJfg2D23zCw4Y79QkpPBLReqM
 GuYHD88XpFyCNQDG5Cmiuv47u8F4gUERJM9WMx/92hPByxGmUSwjnIM
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX1Q8aN/+f5RG2
 BteJXUvJ3NIOdfEa8RWAkHcsnk07Z0NUY4CR8T4RjGchEcHaf+4MTyqsK29r9vushcZRXXXOSGj
 cH7ylEzoobbTh2YUpbaRQzXwME1+4DY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX7Yj+ZtniXwYM
 NTk01MvnonsVTbKtqKnzg29FfWPhBiIGI3lE23mDQ9fmexzfGH11Vn6wSvez+tzlHwt2ka9LPKr
 CxqAHktPabxxs7wGUFUqBtAJesb8EYfWe0vNH5spPl05yVjv1lqQzxTjlV5Ydm5TLh9fixI1Oew
 qJmuT72kKGZEFVnyVVp2gAfEjXzhjM2KVOrgrWxbYjg5b2wE8kaP058a/QRRgl2Uuq+t71ZdHm2
 6gQY+XBXokV7RRfSklwCHzO9OKe9SiSriowIpojoYwwpWxVatGo8C3zXPuXaeMxSE6xTL9k2ZzM
 DTUq95/rG2PM1y+rpOO5fKxhphZac0vuzN6ke+sstyguavTTNJ4sSFsDAsNpm8WAWb8lXcD5fUT
 4Q+bOz59mMdKwrOGz/7SipOoEHe1zfoD6XjIj7eGEfgIEIXnMzTgjBvpXxl+dyEuHGNFeYA/zSR
 PBF/RFhxpWg8qLByFUg==
X-Proofpoint-ORIG-GUID: D3G-zghfXETkeEj3qpdy27voqLcasrY_
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a566f59 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qQQu7YRYY0fa_xNKXW0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: D3G-zghfXETkeEj3qpdy27voqLcasrY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

The PSCI "reboot-mode" node does not define a compatible because it is a
configuration of boot-states provided by the underlying firmware. With
the new firmware-node based cells in mfd-core, this node can now be
exposed as a proper child cell.

Add the psci-reboot-mode child cell to the psci-mfd driver with a
named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
reboot-mode failures.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd..8c6b78ac471b 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 static const struct mfd_cell psci_cells[] = {
 	{
@@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
 	},
 };
 
+static const struct mfd_cell psci_reboot_mode_cell[] = {
+	{
+		.name = "psci-reboot-mode",
+		.named_fwnode = "reboot-mode",
+	},
+};
+
 static int psci_mfd_probe(struct platform_device *pdev)
 {
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
 				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
+	if (!fwnode)
+		return 0;
+
+	fwnode_handle_put(fwnode);
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				   psci_reboot_mode_cell,
+				   ARRAY_SIZE(psci_reboot_mode_cell),
+				   NULL, 0, NULL);
+	if (ret)
+		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
+
+	return 0;
 }
 
 static const struct of_device_id psci_mfd_of_match[] = {
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 93e4029d9506..b736a80eda00 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
+	depends on OF && ((ARM_PSCI_FW && MFD_PSCI) || COMPILE_TEST)
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1

