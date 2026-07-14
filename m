Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD59A3009D6
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049479; cv=none; b=s3Ph4L/7g3rSl7E3G+f8GA3OZLcJ1wskDJz5+2r1gS4E8rIJfast/FM4hTrVMnNBGyOUf/Kh8l1Gu15aTNpaKjqiDUYGo7OUIHelJojKsQFsgQzgM7Rbpn5LSBrJQMwbwh4lC0B1h4BSiRc7YLJuvrKm0r22uFZGYtVKhbSh1b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049479; c=relaxed/simple;
	bh=2g/1r+tUGIrYD+Rpn7qaYdeF3w/p959uoI3764ZH9S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awRai3uPACtwX5+1bxOMLbULa70ihVg3gByItcCuX0baK7s6etp8F4ZizvsxjqA/0ZJ0oanSZ6oJpc++zked6J6Br/F51UHelq379un6HyF7zmkImFVCBpdLq/Zt6+WlpjAQbiYRU4hU5l7Q3ZPUovNgADGI4HMKr0Xn0wio9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olQ+i3p5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qu9VURof; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olQ+i3p5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qu9VURof"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG70vt852804
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=; b=olQ+i3p51ODhRg2X
	0dXQ8vmRFQzbniW44oE8+jTuBdtnwuoauiYcPYGzI3xg2eohPZxsPYbPBHeiaZVR
	4vk/kp2oX9xy1uimqdzfN4z0ixDc1Hb8M/PbayfvX5vU4C3pv4HUsOREEuoUCh8V
	kw4EU2iwgqemCvbUl3blD0EUqSjed2l9iWces0GFO4GKI9ZHpP68e4pJwFpeM4u8
	+tQQ3S7F2y9lyNR+x++fOL2o2y8XwzemH4MCGqtiG3A60VkVkoxWo7XrrqDf7Tbu
	yxfZhRjWmQrMzSl93n9Tm8VISd5AwrAfKv4g0a2RjJyFSR0TQwjwMT7qkPNa43uY
	vWR9Pw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk1dqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848551b54f5so8790116b3a.0
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049476; x=1784654276; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=;
        b=Qu9VURofymKCRam6XWNpGGt1XEJIIT6i1Z4E3HYiKRSKWP7MBxQ6ohc16ZsuG2qOQj
         j81eFdq7aLKXhlk1xs8Be3EBp3ZwNIzLXE8eSKRR7z2Kz7/DHz3W1sNWEjblAI2MDXB7
         evECemu1jQbVkRofu3onx2FBZqq8m1y5BW9ONMGxD+mle5/qfabZcijQhsAbkILkrWSc
         YevUm88AsiJsfwtvEF3rmt8mI2r97xtOMAblzPgY3P2F9g9mm/RvzqSCeMtKKc5e1Pfu
         VN+LQTnPethOG/3IQYK3pu8a2aYf5x5E/zP3X63olk7j68zmUgdXX7wxIayufqQoXplt
         f7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049476; x=1784654276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ja824+WEhomskfYCkM3rLk2MZr0em1PMkZk1CkEWLQ=;
        b=S5COvZp4V2y0K5WiX7V4bPDlB9ntMZ04b/0AzcHs6FA/YX1umGKSXyI2h9KO9gt5tu
         3TdPjOUeHBu1soKZd1Fa0l8vNY2WA63E3tBLk8DC8oX/ilGxaIGjwt8AgmsfyVD5CPAI
         4VmUEpv0HAQHNToq3fCWQOzs1zWhqm/RIEKsNmsfYTVnllg2Iw6qt80dhoIMFcYoFHvH
         Kx7UkV9xk8Xa8LQwpuKDiDr0G9JkapXMK+xBu6sSp+2875389vJfcEllJQCdJ+B+v8fZ
         KQkB61KNQkZPWp20/2bcANlasRE6T97/DoWJqCHGG7jmjYDghhdUsUMr3l+gzt5pvoTF
         QRgA==
X-Forwarded-Encrypted: i=1; AHgh+RoXxGAQ+1sf/T7dgCM3RNgpU0Pg8OCkME8eg95Ck4rO34lrrYuz7RA1XZ08rBCJZY0+S/E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwR/luYDizdfb3HF9pefiR/xEreXeOtUJ+zB2WpiooUdKLklRaM
	uNfWsscvJET2hvi89HvjBF9ji4lNAmsbqiXx4GA5jTNQeyvSRb8REgYYSyPaTrBwKO26THKoWN6
	UM57Smj0gVBT7XAAz5BqMwEHIwLHQQkCNqNV94D5afM1wdChO0UEZkQ0=
X-Gm-Gg: AfdE7clhfvufQKcYOWS2a2VVLnWfa8Y6CtNqFm2yCPHL7wUb8JJnrA9tZuXPXJiFzXk
	IljoZ00KfRpQ0wDHEBo4neeJKZeCYMMrS6R6fFy4VoJi6g27j+LhUGKBkerkuR6bSLJsZQ80KBF
	4Lvm1wdVW3jmamZrF14DZfZEPSdHl0m6IXH7nTlWy4aclDPe8NQUkYkYwb+ppEhKdNHuKzHWvgy
	67ruJrzkZnGfy/TPpQozXOogvnuEdMAlJtymiv1E7awxMhGdWxMXOLRemHJM2XU4Zl+zVcJjjqe
	K/HBw+MqvAG6bZjwNB73+g6Y6D3J8yxNI8fyEEyQaRibJZYe1l5qDTfABbL8jl7es7e/fRCgz9k
	yQaVBOfBKiNUkqldvnZla5qw+CPFoSHbG3kuNz8K6l5U9Pu0=
X-Received: by 2002:a05:6a00:18a0:b0:847:8387:e32a with SMTP id d2e1a72fcca58-848896ddd25mr12586621b3a.46.1784049476113;
        Tue, 14 Jul 2026 10:17:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:847:8387:e32a with SMTP id d2e1a72fcca58-848896ddd25mr12586579b3a.46.1784049475558;
        Tue, 14 Jul 2026 10:17:55 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:55 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:35 +0530
Subject: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=5437;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2g/1r+tUGIrYD+Rpn7qaYdeF3w/p959uoI3764ZH9S4=;
 b=RmGqrG14uHOhF9BDsVH78VIuj42ggnKscphUOnOD+Gsmj+ocFk015pzZWMOf1ClDpSeh6qKxr
 o9Kk+eX4kGJC5I1S6kHDTRVsTWq5oA0b2e42D470B9lnOFzbRc1I0zn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: x_kK6MAuf4EskYRoHV4MxDa-3kNOlwJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX0705WGweF+Gl
 HKE9jVBPMsiKnxNnqVHjh6I8zNcKRQrZKKbJl/tzTma39zMM3laWsa8362dB0rBTQLUMCV3Ag/2
 SDEkCs9PLraWdjVcKYJPSj1wg6J2A8/4nrRmXthdVvmtME0kSjCVGMJUZi5rho1XiUuCbiXXi3p
 s+2eb/QcQEwoD60tcL8IMjc9hdcOuXkC3+S/HgSjl2XAnVDpln4qa3HJKzPxTPZ7PUNerICCkrs
 dT4STdKGfFzXgzgmY82zXCHLdh354U1t/iZBGNjQ039l8Azb490zUHWGCZ7xL2f584G4y/GHcPB
 7L12oCUFcZaEg/YWpQsKuPnik3oPzx9w5GaMUz+bH8C9TqW/Irxsb7GhLwLtFCBwtDxaqpR3FBd
 ia9fmxqzdEBYum1/QhndakiD2N/MCHa+l3hG0gsdVVGq9pbTG1xmXUjUsKlLnCcMnW6M+3vdw6P
 0gsypCr3TVOftOF/4OQ==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a566f44 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5CqnhzuZLWPXzHx0y-cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: x_kK6MAuf4EskYRoHV4MxDa-3kNOlwJ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX8r6XUNkGsTJK
 KJuMJh2d1LWL3LhV7N5Hm0gDHZ7Hb3uMeFnhvmfz+b7G3EM+aLnlMM2EGRbuurNMOpK2xmI12yF
 Rt3yZpH4qvz0/+i5Kl7G+28yc7lg8zk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |  1 +
 drivers/power/reset/Kconfig            | 10 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/psci-reboot-mode.c | 78 ++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1ed6abef62a..4910abafa170 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21576,6 +21576,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 124afb99febe..93e4029d9506 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
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
index d7ae97241a83..02948622fe3d 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 000000000000..955ed68f1402
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
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
+				  u32 *magic, int count)
+{
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
+	reboot_mode_driver_init(reboot, &pdev->dev, psci_reboot_mode_write);
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+	ret = reboot_mode_add_predefined_modes(reboot, psci_resets, count);
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

