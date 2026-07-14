Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669893019C3
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049460; cv=none; b=nyomBf+CD2S8ZMuKT9vJi409uvvlW1/y2oBeIMgz2ipiLIJTjsFIqWDfychNUvCRmI5t5uVFt1GW49re6z4+Bm19kbhhpb1AwnegkJdikNjMshquvYFovRqqSW5kQtR274YBJSBdQEr5QMMdHYod55H/pRvHJJOQuijbajgxbb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049460; c=relaxed/simple;
	bh=WwBfb2ZvreUMO78WFLpkZieBbDtffp1obNxsGq+C7tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+uqytN23VJvX08H0tREUDyqjY07F+Jp8d5s4wIjjMZUYH5bcSolwH0qccgw17jz6AheXNBGNO74zlrrf/vR+4jQIjGEeMTuljHtvVOpmAXwjYm0kR0X555zQf/lUJ/MZeyVyOFN+NELKsFhD/ZJPSLgCvMGGM20loKYERB1Ze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIpxSKZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+LZpzcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIpxSKZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+LZpzcA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG7Exg879780
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kCPxF6uGGYpLkRljUCIn74j0oFDyhw53Efw/4CN1qbA=; b=XIpxSKZzSXAIx5nx
	dtyL7UV4jeEyKghqFFtLH3t5mpBl07+HTmnAKBLfP9lEyClC7K2tFozz+8w0k4Kn
	Gayt6A6bXKY3wBDjW4omOdKzETpNcs8GaZWHborsUYjqdkqUx0fwdLPEaG68Jcef
	gmwAyj2/e84tKuEX27QBum421jnCugUcfhXG9dbEDLoCC/tO2ay7Yrx+W/T17S1Z
	XD5h7cyoKqLjuspwgpQS91h193NVxA0UhAiUAKuqVq1oh2ZfpOyB+B++M0cTy8XW
	KStsZ+MJYFlezyol2ypXVvXMHR9670IrvbilNOqinDAG6OFUaI56PZHz/5SZqMbv
	JDou+w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0h3ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848860def2cso4748750b3a.2
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049457; x=1784654257; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCPxF6uGGYpLkRljUCIn74j0oFDyhw53Efw/4CN1qbA=;
        b=Z+LZpzcAWX1HKAyT52hxFCcPtSBbOAbw0fgnfsyhfZA7MNpBlAWym+a4jnxyZra0ge
         Z1dlzddbc66Pxrj3n+Ecvj8ejH/NU1rc3IuxGG4PneyWdx2LdI7hg4bFmD2ogGnSNvO8
         X1XvVTGbKfKUGtzFFzGqujgbXTzFrkIn9JeHk5Q1y+ffXoEcX1M6BtJFSU0xd2+orWOz
         o25atoeYWiESZA+GWDcwsFikgIkrGZvQzePCJqLtODaozUlh9WxGVY4LoW2PgE8HXyER
         wyCa33oh6ZvhrYO3rceyi2UKHEXOdXhmrJhmPQtxqCRRFRnoM9PTMWNTqz7DUbzJgWo2
         Xavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049457; x=1784654257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPxF6uGGYpLkRljUCIn74j0oFDyhw53Efw/4CN1qbA=;
        b=ERSHknMJ4aw0vScx9p+SoMGfP3b5ZZk5zHHmu+7WDKjLXmetwMuNDKkhnSWD1Ke+dz
         jmLXWKzdFCoCCidaiFuNJBCJWDk7klYkBIY9JEt5rJVPM/d7JcmDsooBqHMcsGmjOgSQ
         1qD0rm2fynMDibiNsjv94iyD8fnzSeKqtIS3bYO+U0mCRVGlYQpd8/kOhds4hnBiE0Qf
         Hd1ARwtjLUPz90RERmkM29M4oi3s/KBPw6KZGmnjCSZpguxwTGyBSP4mQ2l+j48U5zWo
         qqP9ZWJWuALPGRJroqzwgSTMHnOathzKGU/A37g7DhGLCJ+xU6DwEHmpfUq+nLSxgkt5
         L3sg==
X-Forwarded-Encrypted: i=1; AHgh+RrP1QycfPQs8M4PMrcm7KBUBOUWo14SOogU536GWoz7qkhhPou3ptAafANtzNowkA+Lric=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgh8vRWIlDOlcQp2idm0fS6/GGPCSFgAH3T3LP6IUb76LUZjIq
	nUriaHjVlgM+uOENoAnp1ulwwUx8I7vkGe1dGYBqlpJM9RZ/TE16nrgV4uv7JlnaihPvt9gsj9r
	7etSHFyubJo7Z2lTcR2G9hvkq3PikdWbiUs+egSS1CrnyRA+x/eVJAiY=
X-Gm-Gg: AfdE7ckgomfD+b6OQRzgcCY4aHXcdVdXHlfgp1HB/3ZqAKY0Z4hPXjXdq2bO1lD8lll
	FbkY6ESIvGaem/QFwndoCztVbPI6givCBVRCLELQdjhmZMNS8de4LTpWC+WhB8y1WTdbFom2k9r
	glMePhi9JlW/ytE0A7NBCTM7zsz8+YhP7pWJOvqDGhHwBmxpuFJtwpD5oPf4h4vogGSOwD5LSq9
	dFy56iXbvnUV9RWBJNNbjV71Yi6MRy5zseE3VoJFNrVlSzINLuEWKWD1SK+TDGmPDe+vr73oL+5
	Zn+EDtNTqUodcy7uNphdfT2VxX6UrdcuMroQmLOz5RzLOwYx+67EM2rlNFtAWlMNjRAu5RRgHtl
	Ufb4b/Gkhv71FeR06hq3qQswXzo3Wocb6tH4Ff3P2cL/8K+4=
X-Received: by 2002:a05:6a00:1f06:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-848896612c6mr12636114b3a.17.1784049457285;
        Tue, 14 Jul 2026 10:17:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f06:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-848896612c6mr12636064b3a.17.1784049456631;
        Tue, 14 Jul 2026 10:17:36 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:36 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:33 +0530
Subject: [PATCH v23 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-5-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=5547;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WwBfb2ZvreUMO78WFLpkZieBbDtffp1obNxsGq+C7tA=;
 b=WEdIWqidYL4gyeVT9/byS7p/mXPDZVnitOfzgIAtnnqC5h6RRMdVeDn5ckn8JBbNV5EfrHuSs
 BVz4nGfXAeXApyajcnFqdc8bYpM+ClQFd6+S+1kCDr/2nmCXDqDEKl8
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXzpUMgk1uzqC3
 eNMWXypshAcF3p2cfb2K815dFl0wkw3bkEyJl0YMaD5jLQWeHyhuL31XbsKguSjQLxEmIjRo4h7
 GjTB/2G42tqX9K1o0fqpm3GSxDM2npI=
X-Proofpoint-GUID: ia0KYRZpV79SRwA2AH9NTF-X783b-C-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX2qzGlL5oh2pi
 JDLYDKfnmA9JWOdfxUlGmeEKBv9CVAYCwDqb0+jo+XtQZhVFV8lZpgfOrFpEFv0gKFH2nbhodtf
 hFYuezYNFMIlcTX5SZLBb1j5ZIwN9cue3SiUYi3HxxMw86l8dZZk910THdj6dc4+cs90w8HrME0
 dlaZTwMdc39RP9g02JuSV0kSsKmvCF52LStB6q4fzSXllJU93LfxtkJLlTFhCegnHb3rUAdBJcu
 OmaAkfAOUFkjs1fWKDTNDW3CLqAsSTsYdNdjpoSHn/hAPmTtjsvLnrvmkvCvXO5izKPvOZTMbx4
 VzzfJOgQkTZ/kw/FX/6Vr6PUVzG7VNIRiE4mhmNykyBCcV4C9fOV8vEUQcLgzn/T6xH/Jg9zkKZ
 KKvD8ZOA41Pi0GVFfCT+R5N2AuZl54L8rgOwNrMtkexS06UM/3thZ/22Jh/1MeRer0JIOaDRSLH
 MBA4rwsrLGKCdMPCiyw==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a566f32 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=wfThnEy5_2w5d1iZ5YkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: ia0KYRZpV79SRwA2AH9NTF-X783b-C-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to several
drivers attached to a single device node.

Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
PSCI child cells. As the first user, register cpuidle-psci-domain as a
child cell.

Update cpuidle-psci-domain to probe as an MFD child and use the parent
PSCI node for power-domain traversal.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                           |  1 +
 drivers/cpuidle/Kconfig.arm           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
 drivers/mfd/Kconfig                   | 12 ++++++++++
 drivers/mfd/Makefile                  |  2 ++
 drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
 6 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dcffe9fc54f6..e1ed6abef62a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21575,6 +21575,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
+F:	drivers/mfd/psci-mfd.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index b88b01aa5829..c5ecca0d7397 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on MFD_PSCI
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..a2d01810f295 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -17,7 +17,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
 #include <linux/slab.h>
-#include <linux/string.h>
 
 #include "cpuidle-psci.h"
 #include "dt_idle_genpd.h"
@@ -122,14 +121,9 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
 static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.parent->of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
 	.probe  = psci_cpuidle_domain_probe,
 	.driver = {
 		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
 	},
 };
 
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 35f6e9b76d05..8b7fae5d3f5c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2368,6 +2368,18 @@ config MFD_KHADAS_MCU
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_PSCI
+	bool "PSCI MFD for psci child cells"
+	depends on ARM_PSCI_FW
+	depends on OF
+	select MFD_CORE
+	default y
+	help
+	  PSCI MFD registers PSCI child cells and exposes them as
+	  platform devices. Child drivers are probed only if enabled in the
+	  kernel configuration. Select this option whenever a supported PSCI
+	  child driver is selected.
+
 config MFD_ACER_A500_EC
 	tristate "Support for Acer Iconia Tab A500 Embedded Controller"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..7fa0112ec309 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
 obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
 
+obj-$(CONFIG_MFD_PSCI)		+= psci-mfd.o
+
 obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
 obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
 obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
new file mode 100644
index 000000000000..7affd6bb09dd
--- /dev/null
+++ b/drivers/mfd/psci-mfd.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell psci_cells[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static int psci_mfd_probe(struct platform_device *pdev)
+{
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+}
+
+static const struct of_device_id psci_mfd_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver psci_mfd_driver = {
+	.probe = psci_mfd_probe,
+	.driver = {
+		.name = "psci-mfd",
+		.of_match_table = psci_mfd_of_match,
+	},
+};
+
+static int __init psci_mfd_init(void)
+{
+	return platform_driver_register(&psci_mfd_driver);
+}
+
+core_initcall(psci_mfd_init);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1

