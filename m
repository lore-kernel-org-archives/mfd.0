Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596443749EE
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750320; cv=none; b=dVtaUlZ+zvahU4rKTrYE77pko48RqIVasYMcKB2dRdrNZxalMhtL7siEV/2m9cL7EP5VEC7Y6+JQiNaBYg4ohNvtlo9IqmGw6wzSa/5xntgG2ymYHPMM0+Bn4XAByJEay8fhYPWU6WEXclHQD28WZFxv7P8HmMmHNdlxOFx+tuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750320; c=relaxed/simple;
	bh=8t6y60ki3WvBG4I02nVmPEeD2nL6qsnMaolT7hOv6CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewV3db9ayLF+Fh/3YVm67CLEDciXyFttxnxKr9MoB5KyEv+L1tzo7/+9Yp2QjS6YGdCGotbGjEYkOzS43D1ifkBsj9O6zlITOFhAmhVg0Xi3RHWV4jxmM1lSt5RrtceoJgiE29Gcud2hK6yhvTmtk9TkztPB1seCc3IEM6U8VtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQuyDOHd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ve/cPh6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQuyDOHd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ve/cPh6Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737KTbK3959761
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 09:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmS0i4+ikceJ7oOpqw2TVU+CULAM7RtzmwWI6IxadPQ=; b=ZQuyDOHdMIF6FqZP
	AirHbKY3TucuXt3RZxZ48Ojb0Fsd5u66kwsPlohSF84/WdxpweL0m8ZzfR9byR37
	UU51dC5c/JowpPXuU2R9Ocni4FymKEs9rpwjFWJ5tcCeE/APStEjTGdI/jN/NHGe
	hldVrCeI/bpb0Tq2hka4znRd939hAFPDrUpE8UPuhsYD6OQVAKSthngODVcL0oLc
	4sbNPYOv/Qr54sUk/BSoQ6BZM+QB1qvYf733ElK9rIEm5izjYfCopKBvRwwIZ4K7
	/JYyGmJ94iSp5/6QZ8JSF62W54vvBZw/dipfrcsiG1BZOC11AzlqrONVbb8l9QZt
	rgD9Xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajhva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:45:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3179526a91.1
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750315; x=1786355115; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmS0i4+ikceJ7oOpqw2TVU+CULAM7RtzmwWI6IxadPQ=;
        b=Ve/cPh6YAJ7trKcMUH70HZWFODgPykJ56oILQZp+FKYgm5c9E/aoIcuAOLfq/YOdBT
         Qyv6sh8vRXECRNc8OFOnV4K7tZpqghzMrjSAcf3o74hf7Z9h3krH98UvCxcOGiyQ4QH/
         ZW0RaHK8ht7LL4HXTKIWFcQXwDFns2/xwNx/amo4luV1AViXgjNPgmbuTsPL68wN6D4A
         gcRMnRa12eoN7yDe6bKM2ekXy/l4oLMmIPRyn19gp0wzJDdL6r9R/104BXMYebtBF95i
         ddVtriuCmsR6C5y1vFICdVpK5dv4cM+o8E01p3iF/Y2TPWTl56ZSJXdcuXABYqHpMkgT
         8rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750315; x=1786355115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmS0i4+ikceJ7oOpqw2TVU+CULAM7RtzmwWI6IxadPQ=;
        b=LqXc1VXfqPgyffQfGBdrHr8DshVOheYU9ltDK/soebZTkHRWEDttrFEd8yP0lYWPY/
         ZayD0FRMqfY61iY79ix0euGR7idEOu1d2a8R3tcG+RaSjFiq5zs+ZszUSGSY1PsOrl3D
         2x28VX9uU2ULvaBVdcKm1adjtMd0Zg3kxrfrgfZ1iAwzVWNvy4PB3rMxEkdIOICdWXAo
         KcAREjowPzepVWky2KTPLSVHvqeP9HS+xfRmBDKzOVMxAl1Pip6o6M+MKejkvkNyNtqa
         SIWJaEbW6gqeEKgZrjoP7gwlO2e+PQ5VJ4dap6pI8HsR84b0nWa63ZUJvClQgCE5C+Cp
         GYYg==
X-Forwarded-Encrypted: i=1; AHgh+RrRM805MjZNEyl/5ngmN35+JThxHYG5j3iqfiv1Cfym1eYG/NIpC9zkVrWt74c/lXAiexo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmo3V36J7RrNGHCaZ4qbWqHgIbLhzRMsg8Pf9A6Jk6uDBI8kSh
	5KHtPNFOCzNrRHRGEyIfyu1XdbA0o90q6VbrsqJGxcHT+5xZkpFmx9nY2z4G7vNERu1lxYncIam
	rDTfmwkHqCTzDcWlE9nse2qSK1mEpKYUFUn2d1MMg0k5RxFDA8xrQlvM=
X-Gm-Gg: AR+sD10sUoOpi/Ml/Y4G8bhe5NiBzjsW35gVrXa8AeP6bNrFEZ87COy0TBzvw2TBBvT
	t/9j9R10j9ocfTEDao2IDLL2Ndr55zxON5NWd16KI/eU4Vz8n4rB6Il1wogKkYmJUps3j4T13zt
	pHkT40p+66IitQqLVqAT4WpM3I73GczNCtGtKR+yoPHStFOxJlQ9RJ8V3JFIsd8YC5H2nnvXtEF
	5D1iZtXaFy63K4Xyhvb/QBQL0/kANkVj3r5THkhpZsozVD9eo7tpLXFZSMB+EJhj6NWjjX1Z/nf
	s8+RY1Ht5DNZ1+SVKTRJCMfEQu3V63Tn60ZCI/B6lbRiMZf2t47zCTDtoo/jc5HB8aisQRAwPs/
	w+lxExNrPIUGiw5os1x9XWC3vdm7Zql69sisy
X-Received: by 2002:a17:90b:4f48:b0:387:e0db:bc31 with SMTP id 98e67ed59e1d1-38fbc56ca58mr7318537a91.39.1785750314653;
        Mon, 03 Aug 2026 02:45:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4f48:b0:387:e0db:bc31 with SMTP id 98e67ed59e1d1-38fbc56ca58mr7318521a91.39.1785750314185;
        Mon, 03 Aug 2026 02:45:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:34 +0530
Subject: [PATCH v24 03/12] firmware: psci: Introduce command-based resets
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-3-889281373870@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750273; l=7849;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=8t6y60ki3WvBG4I02nVmPEeD2nL6qsnMaolT7hOv6CM=;
 b=iEvQgWnrP8vQjP6P5IvdxVeReewecLzubAupX/0UmqFjxielVZ7Bfps9d6wl83I65tpVDLExu
 icKuZANXYNJAnxQRC8u0vwH19Ja3fDDxi5LUk8MoHzg1/dv03tseGKl
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a70632b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=njxsUegImOJjkw56WvUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KKcmvwsCFhnPZhRPI_g-Slsb77hgrJSQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX6SjHSoOD2rSf
 s87NHOkRhAnisByCqCLd1q/VfhK363KOO3UisMWKwMDloWL4x3hg8cF4NGuxd+gupvKT2GoXLLE
 LV6JLVS7K9wHh7Xx8EsQFHEn7qCqa2g=
X-Proofpoint-ORIG-GUID: KKcmvwsCFhnPZhRPI_g-Slsb77hgrJSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX5gchZK5nZGv1
 ZqncdUAGnih2QBu254Y74Z983+mFYKuXl5ZwIQ72ZP0+79SJBR64htQyFIz4XnfqtEtvz94IcxX
 scks1UvXeJw4ZCMJe3ZLx8c91vZlhSL8NJj1A14aD43KUMuHsh6IDUegGlcpo/B92ct1ZPJuPEA
 Ug3qDbBThQFSaTX2ntBO/kQXHnqiujIKVC0ElsrRH3Nn7DUvKC79NubDNE8xWqDXP28/hz6CATO
 Cc/z8ucGTahurpFCEKPh8rh2rGlKlg/8jcOnuvrGbdcuvaTv4raORPR5tpNuW4HO6bkbTfHxwI0
 LDZzO9BpaItDyu7aFaYdbXPhCPTf2fq7VVSrtSG4GMYnYRrXUxwyyhoLN2b4CLmJ+sMT1XnBBfS
 uC8EZZpzkpJnXwH4yM/OgH4uN0D9ItxFX1ztlQVCCAIZk4tzxj8bcAwNqAzuwo/esdvt3LuOizz
 Qwi6OwOSfYhGAShxFkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086

PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
ARCH WARM reset. The reset patch is selected based on the Linux
reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
for vendor-specific resets but there's no mechanism to issue these
through psci_sys_reset().

Add a command-based reset mechanism that allows reboot-mode drivers to set
the PSCI reset command by passing a reset_type and a cookie.

Add support for the following reset commands:
  - SYSTEM_RESET2 vendor-specific resets.
  - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type = 0 and
    cookie one of psci_standard_resets).
Unsupported commands fall back to the regular PSCI reset path.

Default to the existing reboot_mode-based reset flow unless a reset
command is configured. If a kernel panic() or a emergency_restart()
occurs after a reset command is set but before the final PSCI reset is
issued, ignore the reset command and follow the normal reboot_mode-based
reset path.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 112 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/psci.h         |  15 ++++++
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..094303ef7c03 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -12,7 +12,9 @@
 #include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/panic.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
@@ -22,6 +24,7 @@
 
 #include <uapi/linux/psci.h>
 
+#include <asm/barrier.h>
 #include <asm/cpuidle.h>
 #include <asm/cputype.h>
 #include <asm/hypervisor.h>
@@ -51,6 +54,15 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_system_reset_cmd {
+	u32 reset_type;
+	u64 cookie;
+};
+
+static struct psci_system_reset_cmd reset_cmd_data;
+static struct psci_system_reset_cmd *reset_cmd;
+static DEFINE_MUTEX(reset_cmd_mutex);
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +92,61 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+static u32 psci_get_sys_reset_fn(const struct psci_system_reset_cmd *cmd)
+{
+	switch (cmd->cookie) {
+	case PSCI_SYSTEM_RESET2_ARCH_WARM_RESET:
+		if (psci_system_reset2_supported)
+			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		return 0;
+	case PSCI_SYSTEM_RESET_COLD_RESET:
+		return PSCI_0_2_FN_SYSTEM_RESET;
+	default:
+		return 0;
+	}
+}
+
+/**
+ * psci_set_reset_cmd() - Configure the PSCI reset command
+ * @reset_type: SYSTEM_RESET2 reset type, or 0 for a standard reset
+ * @cookie: Vendor-defined SYSTEM_RESET2 cookie, or a value from
+ *	    enum psci_standard_resets when @reset_type is 0
+ *
+ * For vendor-specific SYSTEM_RESET2 resets, @reset_type and @cookie
+ * must contain platform-defined values.
+ *
+ * For standard resets, @reset_type must be 0 and @cookie must be a
+ * value from enum psci_standard_resets.
+ *
+ * The reset command may be configured only once per boot cycle.
+ */
+int psci_set_reset_cmd(u32 reset_type, u64 cookie)
+{
+	if (!reset_type && !cookie)
+		return -EINVAL;
+
+	scoped_guard(mutex, &reset_cmd_mutex) {
+		if (reset_cmd)
+			return -EBUSY;
+
+		reset_cmd_data.reset_type = reset_type;
+		reset_cmd_data.cookie = cookie;
+		/*
+		 * Publish the command only after both fields are fully initialized.
+		 * Readers run from the atomic restart notifier path and must not block.
+		 */
+		smp_store_release(&reset_cmd, &reset_cmd_data);
+	}
+
+	return 0;
+}
+
+bool psci_has_system_reset2_support(void)
+{
+	return psci_system_reset2_supported;
+}
+EXPORT_SYMBOL_NS_GPL(psci_has_system_reset2_support, "PSCI");
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -306,8 +373,25 @@ static int get_set_conduit_method(const struct device_node *np)
 	return 0;
 }
 
-static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
-			  void *data)
+static void psci_handle_reset_cmd(const struct psci_system_reset_cmd *cmd)
+{
+	u32 psci_sys_reset_fn;
+
+	/* PSCI_1_1_RESET_TYPE_VENDOR_START identifies vendor reset types. */
+	if ((cmd->reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
+	    psci_system_reset2_supported) {
+		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       cmd->reset_type, cmd->cookie, 0);
+	} else {
+		/* Retrieve the psci reset function from reset_cmd */
+		psci_sys_reset_fn = psci_get_sys_reset_fn(cmd);
+		if (!cmd->reset_type && psci_sys_reset_fn)
+			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
+	}
+}
+
+static void psci_handle_reboot_mode(void)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -320,6 +404,30 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+}
+
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	const struct psci_system_reset_cmd *cmd;
+
+	/* The function psci_handle_reboot_mode follows reboot_mode based
+	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
+	 *
+	 * The reset_cmd is configured at the reboot_notifier phase.
+	 * If panic() or emergency_restart() occurs between the reboot_notifier
+	 * and this final reset, skip command-based reset and let reboot_mode drive
+	 * the reset flow.
+	 *
+	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
+	 * calls to reset the device. If it returns, either the reset failed, or the
+	 * command was unsupported. Fallback to reboot_mode based reset flow.
+	 */
+	cmd = smp_load_acquire(&reset_cmd);
+	if (data && cmd && !panic_in_progress())
+		psci_handle_reset_cmd(cmd);
+
+	psci_handle_reboot_mode();
 
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc4..e81b1cdeca51 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -8,6 +8,7 @@
 #define __LINUX_PSCI_H
 
 #include <linux/arm-smccc.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/types.h>
 
@@ -21,6 +22,16 @@ bool psci_power_state_is_valid(u32 state);
 int psci_set_osi_mode(bool enable);
 bool psci_has_osi_support(void);
 
+/**
+ * enum psci_standard_resets - Standard reset selectors for PSCI reset
+ * @PSCI_SYSTEM_RESET_COLD_RESET: Standard SYSTEM_RESET command.
+ * @PSCI_SYSTEM_RESET2_ARCH_WARM_RESET: SYSTEM_RESET2 architectural warm reset.
+ */
+enum psci_standard_resets {
+	PSCI_SYSTEM_RESET_COLD_RESET = 1,
+	PSCI_SYSTEM_RESET2_ARCH_WARM_RESET,
+};
+
 struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
@@ -45,8 +56,12 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+int psci_set_reset_cmd(u32 reset_type, u64 cookie);
+bool psci_has_system_reset2_support(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline int psci_set_reset_cmd(u32 reset_type, u64 cookie) { return -EOPNOTSUPP; }
+static inline bool psci_has_system_reset2_support(void) { return false; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1

