Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EEC388880
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750355; cv=none; b=GnmCOIsVcz/+Hajj/yS3PXdpg2Uo7Rps45mPxN3ZAGj+SdWWS5XT5gIIfLMXIHqZSiTusW7jYTL2XW0IXmQtDZtC56U0Z2H7qA/PqpbNdEc57ufjy1nF7jhq8Ss8esvz6Y1cIIjRx9iic03icgq0KTS+LHcaAdKoxyN8+LcmLY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750355; c=relaxed/simple;
	bh=IqjZzKl7BNCcMxSaF/5GXH4dOI6iylxX8niIaIkSeSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7S4VugqbXcYU9cwFGINI+3h2cbbd7JZnPbhSWYUh4XJrzyVBhr+T/wbIE6CaNPYTal9bu39mMh5fGXdCDm+MVvMGpTftYvYXEC58zL4bwKCC1D10jKdXVcZs4NlgYMgWJ/vffHcBkmBMoiDdWGX6NgotOh5+P5YcmWZV5mDqXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2+j8Yif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4cA+Mor; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2+j8Yif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4cA+Mor"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bgux3957461
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 09:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=; b=U2+j8YifrLrGpHLf
	DagnOKH5YQVkmVgEsYiYdrTjJ44r+L1oIRaC9h0ICZlvQSQuX8tblcc2WzG9VizG
	JiHWhc2kLcnsJJiy6+MJsZCOkLWm3VHNBXZcj77hlZsncMPAZSEmuj6G5nrUJ7ng
	8HgjolqMvaZEnXkE2kDllhCaJxKL780lKiWoM3YEC8HcCPQ2XOZT+aBsMIowwbv2
	GggyiZo288eBc8OaIuTyk7ffxS5wNk4KrK7JciNCl4F354usc61ksDbWt8F41NRQ
	GFDSilfhagTNLJEshhgsFEqiOl9kzsNwZafxenYf4llM+u2be5ynk1c0hVqV4jub
	o87HfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnguar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:45:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5122873a91.1
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750345; x=1786355145; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=;
        b=Z4cA+Mor5BIG6eY/+QSWW58ynFdpWl4EAmlrbaYglCx84SvidkcZSYbot7CKKC6l+L
         oMgcysBSkWSxDFcj0Ysk8apAdNymZrH9ffUKopXSXGgG5kjKl0Ldj+DeLFy4bFcseEXO
         3FOdXREftuO/SNJl47bywDDgeXZURtjl7YJqoOJPUDOuCk+cdMF1frlSjehQfjaraw5S
         Y0qAxfROmB2QI0Cc52cCe/llQIqojxINYMN5S//MhZLMC6EPsRg6JGzE5qSMCrI8TcDu
         wxS4LvNKJAfmmnRQOdx7LHU5cxmMYA1CzP1wA40gAIZXxKhP5NGL/IjgOR17ZfZ/ILdI
         /wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750345; x=1786355145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=;
        b=F6uu1aMtes0ki5iZ3ptsjNpSN2gaCB8iAgYEuiw0oo59SEy/q7h6G9MaC7WVhHibFm
         iJkEsIqic4Nq/F70BXfKg/LjgbfgzwRpF/j76c9yLJxYnoCgzqfM9H2CAwv7I38PJGts
         aQ2vLG7JXyyk5DEHpFTEWnOpJ2uMJaa0MU3wmJf9z6vGFpMaQDYD/v06pK9cdgQIdUp1
         u/XW2dUzBEHqSZDtu1TP9Vkdi2NhA1NPk9Bh63V6XFs2SVqnoUFsaqgcgq8+SuTcBHUH
         72a8DvMKde2+m51DhnZJvblJQt4DVwThs/85mGOUI1mAHOEDr1Pm3uYw0PhcwjFV4iOU
         rmLg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/PoBxwHbfOxNTan45nvFUY3rDQV5ftO8ji3KmUE8vblH00ZmnXNqIiNZ+MGr4rqutWOw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6IpyEV90IuY6iJjq6lNK2cMbcQYcCQhjSsksgKArTAQbEgGzB
	ZShOJiJ7ILgQ5m+F4S4FbIll6VCK6AJgmpnqaxIe3KEsmDYXcO1R3jIda741Jz2aP3APE/G25ah
	g7Vz+Ogr0Y0Iu0dv0DgstQ/8sKeM4QF5x/8gVIm7lYWaA8kTGtN3sAUk=
X-Gm-Gg: AR+sD116hqvXAlz45emeK/7dv8olNB+CjvH4T/otyQnu1L0L2wa0r/C02YYcOS0c6X3
	CQEVLg7vE1N5KcwLE/IXJxeZANoyqX9VPHjKZsUzCwiJtYz1boqC0YNVZEMdgRGerts1UelvJH7
	ZSzCjdMqlROaadniXgCwqZgiitOVetthXvBuRYVujdj/2xEaZGuthloKL5cq1LZmyzsb0eI/Nob
	u5cF5mQ1g2+13OLxHSxAEILjMyDtVEfP7QfHgW4e2yd1ZIxMlvO8U5PCew+qYtY85pppOn3Su/1
	1ZQhOolFR6DYxzyXVqi3uh7YM5WVTImdOSwiQMRm986zOLjSOT9kVnqtT0F0H8je/wl05G8e/QA
	YnU6jFRxKTgomxSgVUxwXcHd5QvcbmS6i2BE+
X-Received: by 2002:a17:90b:2d4c:b0:387:df8f:1401 with SMTP id 98e67ed59e1d1-38fbc598becmr9021674a91.34.1785750344763;
        Mon, 03 Aug 2026 02:45:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4c:b0:387:df8f:1401 with SMTP id 98e67ed59e1d1-38fbc598becmr9021646a91.34.1785750344278;
        Mon, 03 Aug 2026 02:45:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:43 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:37 +0530
Subject: [PATCH v24 06/12] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-6-889281373870@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=5554;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IqjZzKl7BNCcMxSaF/5GXH4dOI6iylxX8niIaIkSeSQ=;
 b=VvuvdMCCFfCnpfXMiifmJIg8ToW9mGWhz/YcyhcWBwYZyQ++L8G27zDMPlOvzPWKAgRM6T2dZ
 hAxw26BregDDZ4ndgGJJEgdlZIWzxDPFme60Q11ADtcSKqSRYEiKRjY
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a706349 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5CqnhzuZLWPXzHx0y-cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VYWMZ3spumH1zkr2UWMOcRy4YONnuGyN
X-Proofpoint-ORIG-GUID: VYWMZ3spumH1zkr2UWMOcRy4YONnuGyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX2BIy6Fz9EzeE
 gJaBnyWuPAWKfUQhVo8M7InTuVwlv0Zt9S26JE2s6RBrZX78xttqoqcxLVcble/thQxTZBnPglB
 Sj4TgA9wp/PNfdTqqp/7+YRTNp5FC3GCga1gcB9SPgRrnUPtBG2I9PSsl+oJV5dwgyk3EujL+VZ
 u6u1QEx6kAce9J09Ri4+PA7UhP2QUbWlXEpMVUXNPdGPVXI4aGD+hupbBGx3ts2Ghe2uaJ6DKOx
 aBQUn1YLnzpfjjkSIfdkM0knfnKvllRT/juvJS+c/ZwMlayo/artBR2UOuHHWkmvXv1QdvtJ/LQ
 1YgxUsRdcKvslqcf8BlYmIo9zsLH0XvfqOSMbuAYlGPd05Ng2Q8h5BuWGZwSjXUrlxZJGB8fRTt
 4HFpYEGbH98sISSjLEJBogMxJPrsV7mlycIRrKw58IO4jhHoJ2qS6a5zk8Rw7uiFOv3zvOFs5sx
 ldon2xLYO1PA6TEXv8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX4DUBbYofVWur
 JSFuKhq8w3WKcCXBZSb9QJK14Y5OvEX+OqW0aiTACHQGI4chsiGRirFk8Qgo9lValJmk2m0Npgh
 JIFOkQGOaTH+MouUujYUMPp0U0TTPg8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add a psci-reboot-mode driver, and define two types of PSCI resets,
predefined-resets and vendor-specific resets. Predefined-resets are
defined by psci driver and vendor-specific resets are defined by SoC
vendors, under the psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |  1 +
 drivers/power/reset/Kconfig            | 10 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/psci-reboot-mode.c | 82 ++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b6e4f89f319..a3339b98ba86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21672,6 +21672,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..143f3260f04a 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -360,6 +360,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on ARM_PSCI_FW || COMPILE_TEST
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+	  the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
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
index 000000000000..2f960fda8229
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
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
+	/* Build cookie from arg2/arg3 cells in order: cookie_hi then cookie_lo. */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  const u32 *magic, u32 count)
+{
+	(void)reboot;
+
+	if (count < 1 || count > 3)
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct reboot_mode_driver *reboot;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+
+	ret = reboot_mode_driver_init(reboot, &pdev->dev, NULL,
+				      psci_reboot_mode_write, psci_resets, count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(&pdev->dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_DESCRIPTION("PSCI reboot mode driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

