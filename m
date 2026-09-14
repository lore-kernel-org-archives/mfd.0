Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A47489876
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398096; cv=none; b=YeqqA5TAW4ipMDRovcJ05PUiZSeAwL/fEyTcnZ69NboU0tA+vwXUR2UbT4yxP/JXaOWhnfFnLZLgm8UuXTiqnpA0GUvXZU36EtwCpZubgNjCyypCTb2da9Gpgzrs3sRkyp1qeA5B3Px9wcJgSv/aQgmY7Qjb2Fj9i+T5WdUuNDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398096; c=relaxed/simple;
	bh=kmURiLH0HbeNUKYyjbcEiNP3i7H5c5RQFvtK3PJJyto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEM+LvlQCtVAkOZePAfYmHdiY1D08NpmZJIysHV1De26Q9xKujY2tqvmNPj/Z4A72oX+vDJHFLX45qcj2nzZcX9r4ZMHr2bXbHC3kJJahcg3xkgjy5RSbDAE/IgaAeK7v7Qhvf8i9im4qrw7DkmFl+WCPbfn3477f7oVUdfqDbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7tAc7LZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBDoBQwn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7tAc7LZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBDoBQwn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0bqN3588221
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yXvTTCDIbtu2vy71Vu0vYymlBft+UiYBz6e9iJYcdE=; b=Q7tAc7LZMbnctMu6
	vQMMQ2bYNDDOyfiBhs1f1xPfLFR+IDeGswu13pHQ26n0kyCQB5lRYSOoFauePkqG
	Z1gzdDyEKGzKCM5HflJXVcYOK7lbcRWmTTQfJ/+AqxRpXJ2OHQc3KAA7xxfogFoK
	HZ5UOAp+OMcOzPzyH3bE2YsF1odMvEeAWltMJqd9b9cgSx2sydHY4bFk59UL9JKT
	8580+CC30F+yjdfse5iLtO6p4Zw7iYu6g5QAFPcd5VX4OoV+WD7l6OJpdYPEgzbD
	9cpLtOQB1RDPbavJyy5MQjRZABGOgJ8O0a7b6x7lwQInd4LMHhzEd6OUBGyeZpxG
	lhIUOw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg97bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:01:33 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f8931a803cso2944940a34.0
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398092; x=1790002892; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yXvTTCDIbtu2vy71Vu0vYymlBft+UiYBz6e9iJYcdE=;
        b=fBDoBQwno46NqEPg9AKILl6bKEP3CP2P/0WHdDC/qLIQPWHOSNbjP+384sWERgMnyh
         hWEygg4bhUkuKCYsR9ld7lQxW4ixJsOi6x2+ILVxs1ijKL5cnA6qUzMnNpr2qd3Te5KK
         GihCI/qqi9PvShUVXxpjQbf3oQDPHXpkc/X4Nnh6G+pxcrQ/grdyRBWT9ixu6lPYez57
         sE8Br4fxb7nGKlAor57QLl7fU3bD9hWHm1CE4swUJa6ZnF8Yn6iVFXwIlssXPZyyJ0NO
         YEt5dnzmsESlaxfUjM6BvdIVWNIwre51zG44fQ0ca5VWfN7E/IGt/XPMa+3ZJjmHbc5Q
         SotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398092; x=1790002892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yXvTTCDIbtu2vy71Vu0vYymlBft+UiYBz6e9iJYcdE=;
        b=sCMZNXkZRiss3MLvCBiHxPqcCUr8Rw30qbGs1qM0p7VnFEKV8SBiLpMHaszOOQPot3
         by9IxsQAXXWmtXsg0Nt6cs1MM4d6MpGgGtsdgaFqBpkLi7gBPtyEuoMU8LFEsHScAz40
         rIPbTztpNo3eyyTQgR+UAzsSQxSKDDm++DoEsm/9UI8Uqg+LJE6RFSbYDNKx2v1n/UvV
         IkKH1IS6LBo0U1hZYqS399vas1PvLLSwuwxu79fvjZb9Y2YcwDEtvhEWR1jLc7VnugIY
         9SsNuAx2NOqSrEwYrEAIJTbtsi8irb6AfGNBuQWbqsH+UoAOfDlBTMYA647OvHcmZBCQ
         N7RA==
X-Forwarded-Encrypted: i=1; AKwUvBwoYM/JomllTPexSp4DP8m6USRbHusdSfXsd5IXh9NU9VjV62njYGvQH99NWE9bWfAQUqs=@lists.linux.dev
X-Gm-Message-State: AFuF++kde1eWs0ksucvrfFFoO0vOUVNcY/8jjvNCE9SzK7wEYyUPMYtD
	ufENwoClcD5Dvz0hEfi0yHmcHXWkCVdIXW08h/wRV9iwcs2ayxzRdIC0WufEXsxbEVfLpdYwsVa
	kjpjO157ITW2X9LQeYJujS6uN+8/41XG7ZYp8UyvXwbgaADSOgT3QdoY=
X-Gm-Gg: AYBFou1KqeTiZyzGH5G9dKRlMJ3AuXeYBbWnacH3XjBtY5ZxKSffKrnKIWhlePUu9u7
	tujJ3uHDwh12nxBo/fKQbo15z98xXUxgOc6wRb9zwm4vqCnfFoDo8+u4o5X6lBXuJ3xvCjDVGA6
	ZAMte/9ELalFsAUjtZ9XPmsfFdu5XDk5KfGnYoNvpJ2zGQaNS2i8kv/MpUzhXwcQV/CAoBWPeSW
	12xWDLYVhDE4eZmIiP9qGjZXxql8NqW6D+bzkVuaM2osmxpafsmudjrEP3GSFHNB/jiesnSIQn8
	bxERcZ1MulfACkzlMIBc57BJKy36PDdjA3xM1gJEu0xvMJGBoXsg1qh38WcV3I3QMZtPJAOjYx2
	9/SP/FI+kfnpWXpPdY+mSDaTFzMm583FozcQG
X-Received: by 2002:a17:903:2312:b0:2d8:d4d3:3fbc with SMTP id d9443c01a7336-2dd6c741b20mr62015505ad.16.1789398058254;
        Mon, 14 Sep 2026 08:00:58 -0700 (PDT)
X-Received: by 2002:a17:903:2312:b0:2d8:d4d3:3fbc with SMTP id d9443c01a7336-2dd6c741b20mr61907675ad.16.1789398026267;
        Mon, 14 Sep 2026 08:00:26 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:25 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:10 +0530
Subject: [PATCH v25 06/10] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-6-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
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
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=8962;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=kmURiLH0HbeNUKYyjbcEiNP3i7H5c5RQFvtK3PJJyto=;
 b=/V/AdimkUBCwTl+pJFMpVXlCpbHXB51ulryAX373joLKS3jPXpUgfBQryXrHBQ2qu4Q3fX+yQ
 UMISbaYe4JcBOjrKcysrL5n1TL24HIiepXI46g7+5ZiIAdEO+v4rdUg
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa80c4d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bUBultAy4ErWMeHVyy4A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: gl-iIiqegp8669sXveLN9Dy-cgtL40JD
X-Proofpoint-ORIG-GUID: gl-iIiqegp8669sXveLN9Dy-cgtL40JD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX0h4HxPHLufb8
 zQGWxPWlXc8l14+ku+kVQwxZcbuipsU4lM1HSjCKmRhxmrRSV2ARxlNfYBuKbfuKWckeDDI1MLA
 zfwC4t04v4maJNt5Qfyf74JYAZJ/ox/CP9QwIvxtncTJ+SsaWc8aHL+55yezz61bY8NRug5fVQ1
 G/aYRCIBbDOc0rIycseZiCG7V0p0EAR/RhWXqPmIUtYM4dPvJrUon8vGfEQUhax1n0USE7JhSRK
 HKX4+1bfEUuuLusN6hg9OOTn04OPs7YtXEivuLkGm1jRNLIUG6OWmUJ4vaCTetqimC0Gle4DN53
 izLvxQsivRpDL919UVdOUM+D3GJ5SRxsqF3Dz/BVWplhtKkoHFb5cIqLNKScDHj7PSgawZ2QkcY
 5J0+5R16rLe/xy8A8G0Bh+Y75Z4fZgdD9NEbtrUUP61JjzDnZUZ2czCy3isEtkI6q+CWrR67t1V
 o2nkF/5uEszmIYAJpPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX0yCPz6ZEwO/1
 K1Aopql6rgl2N9im/xpwVJHH1OrFcFe2Xwl/xORH7DKcQGlhicjXjLhWWr7MHnWWtbTloXimZWp
 3n7KgfkDLwXZ9xJuTyHFQMur+PZD1XU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add psci-reboot-mode as an auxiliary device created by the psci-devices
driver. Define two types of PSCI resets, predefined-resets and
vendor-specific resets.  Predefined-resets are defined by psci driver
and vendor-specific resets are defined by SoC vendors, under the
psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |   1 +
 drivers/firmware/psci/psci-devices.c   |  71 +++++++++++++++++++++-
 drivers/power/reset/Kconfig            |  10 ++++
 drivers/power/reset/Makefile           |   1 +
 drivers/power/reset/psci-reboot-mode.c | 104 +++++++++++++++++++++++++++++++++
 5 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c0334ee2ed2..1c0f111ba197 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21933,6 +21933,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/firmware/psci/psci-devices.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
index f1eca61e3269..43e6743202f9 100644
--- a/drivers/firmware/psci/psci-devices.c
+++ b/drivers/firmware/psci/psci-devices.c
@@ -4,19 +4,86 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/device.h>
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/slab.h>
+
+static void arm_psci_auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	of_node_put(dev->of_node);
+	kfree(auxdev);
+}
+
+static struct auxiliary_device *
+arm_psci_auxiliary_device_create(struct device *dev, const char *devname,
+				 struct device_node *np)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = kzalloc_obj(*auxdev);
+	if (!auxdev)
+		return NULL;
+
+	auxdev->id = 0;
+	auxdev->name = devname;
+	auxdev->dev.parent = dev;
+	auxdev->dev.release = arm_psci_auxiliary_device_release;
+
+	if (np)
+		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		of_node_put(auxdev->dev.of_node);
+		kfree(auxdev);
+		return NULL;
+	}
+
+	ret = __auxiliary_device_add(auxdev, "arm-psci");
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		return NULL;
+	}
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
+	if (ret)
+		return NULL;
+
+	return auxdev;
+}
 
 static int arm_psci_probe(struct platform_device *pdev)
 {
 	struct auxiliary_device *auxdev;
+#ifdef CONFIG_PSCI_REBOOT_MODE
+	struct device_node *reboot_mode_np = NULL;
+#endif
 
-	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
-						"psci-cpuidle-domain", NULL, 0);
+	auxdev = arm_psci_auxiliary_device_create(&pdev->dev,
+						  "psci-cpuidle-domain",
+						  pdev->dev.of_node);
 	if (!auxdev)
 		return -ENOMEM;
 
+#ifdef CONFIG_PSCI_REBOOT_MODE
+	if (psci_has_system_reset2_support())
+		reboot_mode_np = of_get_child_by_name(pdev->dev.of_node,
+						      "reboot-mode");
+
+	auxdev = arm_psci_auxiliary_device_create(&pdev->dev,
+						  "psci-reboot-mode",
+						  reboot_mode_np);
+	of_node_put(reboot_mode_np);
+	if (!auxdev)
+		dev_warn(&pdev->dev, "failed to create PSCI reboot mode device\n");
+#endif
+
 	return 0;
 }
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..5c349f41e097 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -360,6 +360,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on ARM_PSCI_DEVICES
+	select REBOOT_MODE
+	help
+	  Say y here to enable the PSCI reboot mode driver. The driver
+	  registers with the reboot-mode framework to configure PSCI
+	  reset commands, which are executed by the PSCI driver during
+	  psci_sys_reset().
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78e..45d8aaaffaa1 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 000000000000..bf2dd6626feb
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kconfig.h>
+#include <linux/module.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/*
+ * Predefined modes use two arguments. arg1/magic[0] is always zero and
+ * arg2/magic[1] is one of the values defined by enum psci_standard_resets.
+ */
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
+		.count = 2,
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
+		.count = 2,
+	},
+};
+
+static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
+{
+	u64 cookie = 0;
+	int i;
+
+	/*
+	 * For a 3-cell magic, arg2 is the high 32 bits and arg3 is the low 32 bits.
+	 * For a 2-cell magic, arg2 is the low 32 bits.
+	 */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  const u32 *magic, u32 count)
+{
+	if (count < 2 || count > 3)
+		return -EINVAL;
+
+	/* Unexpected value at magic[1]/arg2 on a 32-bit system. */
+	if (!IS_ENABLED(CONFIG_64BIT) && count == 3 && magic[1])
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0],
+				  psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct auxiliary_device *auxdev,
+				  const struct auxiliary_device_id *id)
+{
+	struct reboot_mode_driver *reboot;
+	struct device *dev = &auxdev->dev;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported. */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+
+	ret = reboot_mode_driver_init(reboot, dev, NULL,
+				      psci_reboot_mode_write, psci_resets,
+				      count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(dev, reboot);
+}
+
+static const struct auxiliary_device_id psci_reboot_mode_id_table[] = {
+	{ .name = "arm-psci.psci-reboot-mode" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_reboot_mode_id_table);
+
+static struct auxiliary_driver psci_reboot_mode_driver = {
+	.probe = psci_reboot_mode_probe,
+	.id_table = psci_reboot_mode_id_table,
+};
+
+static int __init psci_reboot_mode_init(void)
+{
+	return __auxiliary_driver_register(&psci_reboot_mode_driver, THIS_MODULE,
+					   "psci-reboot-mode");
+}
+subsys_initcall(psci_reboot_mode_init);

-- 
2.34.1

