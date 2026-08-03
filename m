Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEC537C93F
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750329; cv=none; b=uE1CvrVN7N1txbMyR6jYFnvyaz36AKLpKKxemQ/ERejLymxl66aHmzMORhtAyCtfekWD01ReVJRL2R9lsratQDC57C5NP7segdekxjk3Qv90AYP4D/ofH96W9igBIX5+vEofduf2un9F6R7fDe3DHKL61XW2sB7/3eLOj3UZNJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750329; c=relaxed/simple;
	bh=14Wda5kuxCa3ilXVAoY0TfVZfkEE9VqcOuvoOICdoVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iATr13yfkFNQIvehOxYlOqI+wjf+ljGUc/BnAyAuj2Vbn5W7mJHreFjZe8AHhNCQFszw4/eS4GpO7fPRt/R052GZPV1GZAAYrK1tyMbjzK2z3+wRqdMRk3wtJn3fhOxJGuWBKm8tlem/zW6c5nkzcyyI1jo5yLUKUiiS6fjtJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9Y4Ke9f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jqiu88ow; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9Y4Ke9f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jqiu88ow"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736Dg1o3882726
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 09:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4D+pGGbNl/vhgsCUDZ0lT7ihke5qeqjPnm8lr8lBIY=; b=S9Y4Ke9fetdzZCLQ
	d6W0xPF+376FSs+qGvUboSD902GzFzpnyvsGxO+QG4vh6MigY7lcE7cFRPNNgMb3
	82v5VS+bd018/IzcLxFUZ/0k6evixIgnNGWYdz8B+L+OmdmaXudkHvxyWnw5p0i9
	+srfy5PEgYEsqxVVUzQu1bUj/Eu0XGuxE5Tn0jVpF1JCZCcbjjPVgHJ51jm0F324
	h/b7k08U0iffJFFVXCr1ED0LGDeqQAFXP1FwVzBkfHtMYvFsuuQvZdxtkF3W3Efy
	I4Xt80jwBCoOW1frLsbbaRVXzbAIXeVV3M4Nr+a5m9Eeqda1N7g3srwOpLpt5i/z
	Krk/7Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgwdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:45:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3619361a91.0
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750325; x=1786355125; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4D+pGGbNl/vhgsCUDZ0lT7ihke5qeqjPnm8lr8lBIY=;
        b=Jqiu88owVNNbNZ/YEJKLsPF3OVVaYFABck62FRNOamzzjcTOKIBKE5NMN05ja1+uFw
         /O3pnr5d3CaYp+0nIn1Hww8UEQNSW6BcrRw8mPk5C+Hgg8q3VRkUHVk/ZKfzgLHqmK2G
         a1HdXmaisbnJC+PU85rfQMWQV4+LaUf5ZkdQ4z4tX8lCX2bXaKY0iusUlUjv7JJoLxqN
         UEe36xvqcYaKqHMC35YkD8mUsKZdUQ50DNnEOMaCOsW5D7D0xOH+lfeKKhJZZiRMg0PT
         BWnlnVD+LfzBtS+YdKrLJ+htT++jVNeI6Y4VFegqi/3Yw7RXjummglLYZG8NHmQCbDRc
         tdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750325; x=1786355125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4D+pGGbNl/vhgsCUDZ0lT7ihke5qeqjPnm8lr8lBIY=;
        b=nkukQ/s0idqGKaZPtOXtSD0upgn9/+cIgqG74nfzSYD/gASHRefNtDf28hKRwEVLy3
         7DPwUh0sDKSoK0loBc4lADD3BXGUitG39MqXt28TFq8hTDQQ78QScqVKEawniBUKKzKO
         dsFO+ZxC9NRGuEfDBAdmo9TnxQK2AukL33/V4K5UjwNqieIYG9m0oXRKr30kDw0U00AR
         w2e/6IwFasUv2RoTPUsgk6aqBalhi8VNTqYTEkPCZwa3Ftb9VypdsOaHDKfybGaXmfyw
         QXcQoz9gki83UOFySG8v8SLhaQ1kyFakblYw/FBML7KUZMwVVtJZ/Lwrr2p2AwyIJiHM
         v2pg==
X-Forwarded-Encrypted: i=1; AHgh+RrC8Cn5e7axBltj5C5xG5KVVIvrsPIDhiSqgH/iIcWf6gpewOMWfd5y1S+d8zcPBQ5o4Bw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5PU/Rz4qdkJd5n7xWm13pbeWtxCuy4c89EcoUWByIWBXuSahK
	IhxXB0CihYJS/Ig4md7Opc0PKtH0uS7odUO43rl9qDmRPal2MTdDiKYO1l0U88OwiyVb0sVZXHK
	yU632HMiSqpUxzURKYrgdb4kOZT+KhoDo60lgIb2bCePzULnfhf9Dn+M=
X-Gm-Gg: AR+sD123n7HzfUDGtpnCi8wryiRCYrBPjsD3iBSRT69xsaO1LHbJrcySPIJXv6B4lJT
	ProFjXfa06OSghpfKv1U2i25KnV8oVtGZL7sQ+/n+ibFlSBYSYMhMK/8flpFpzCmIGRIJzKMU3h
	ypwkP3dlAglX/omt2IxbictZk7vTM5yWMCT2EV6Qk+co9jIkRPq8/F1EThuAZPV6wncPqZS8KSX
	bNpkspOrTKBw0iPLmxfNYs/e/m9ddOeksV8Z/+1p/OG6CV/vgoVN6nDjqA+hJ6Vppz2rHB0XfbW
	qXTOndemSl8aVEvlPeYbTkbf8PLwEaYuHiHZC6lvpRsY7Dk0oS2evrhL9nXOHFL3Jc4Tn7Fm5PI
	Jm+ZEPgczOW9aRzwjcraDskXVKEXOOEX8VH0Z
X-Received: by 2002:a17:90b:2ccf:b0:38f:57f0:1f4b with SMTP id 98e67ed59e1d1-38fbc576496mr7546505a91.35.1785750325048;
        Mon, 03 Aug 2026 02:45:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccf:b0:38f:57f0:1f4b with SMTP id 98e67ed59e1d1-38fbc576496mr7546477a91.35.1785750324313;
        Mon, 03 Aug 2026 02:45:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:35 +0530
Subject: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=5547;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=14Wda5kuxCa3ilXVAoY0TfVZfkEE9VqcOuvoOICdoVs=;
 b=9IqK9YQfeGIBQH2lyLywWk9vUay4MYLXLPwLUwHLrLKBYO/8Fz8A7JrYANArZU5BL46C/TEgs
 twT/hme0T3ZCsPgPRUMBhJv6UlJYhfMCWuJUcw8p0DoR+YHJ9GsV42P
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: w-k8eLlKIvMeKF2dqTZoFQMcZVh7qjRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX8NmHK2xSzSYi
 ++ncxNk70DhNDYTO869EEJWmZmK/g9J3F0Mta3hYqXvCfjmuR1k+GPLR/P8KO8RNj+oyNltJHvI
 rZrZ83vTPSteB1a1cp8ElQnVgaXo5rewdocBcN0KUKDXhWDyCqA8ATBR0GFPbt0Zs24+Rd668As
 nuq+dR6dUzE/yCVSLMHqIuohAukzpVskBaMxe3BtfLq53AHDUpwQdiHmp+YtfH6tzfC2+TSXJDw
 zGRJWGJwi6j6SKVZSopjsLcpRuQIl3lhKxPkXjqwn7BWfCIMNWo67OR68hCvnCHgUKxbIJzNPcD
 P9J/OLCXb65aiqalbTWygR/A95pEZRNW/34TeRxiGxDxb0jcTBGns5HfYN0oFk7RX6sTgq+7Z14
 lUc+jbZ/JjHB1SOptwE6t8N7XplikO0ud163OgJWbj3IUd+5nSDxO+klJOj9csSO/gU6AB5uaoR
 f1yxhu/JybKwidGSXMQ==
X-Proofpoint-ORIG-GUID: w-k8eLlKIvMeKF2dqTZoFQMcZVh7qjRB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXx8hoTEixli+8
 RcDppNWKuKmaHZmNEdn0REwKJN07wSfVzmIe7fRWk5+u2Los8cy5sZ2K57CDLq6kbHxBz54ZR2M
 kk2D87u93FHctKj704nFpqOR6WISXE8=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a706336 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=wfThnEy5_2w5d1iZ5YkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030086

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
index fe67f7bfa44c..0b6e4f89f319 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21671,6 +21671,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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
index e4fd4572472f..d18655d76172 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2374,6 +2374,18 @@ config MFD_KHADAS_MCU
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
index 72d3944b0ad8..f3edfad702ff 100644
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

