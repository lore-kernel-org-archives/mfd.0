Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24BC1C861D
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049441; cv=none; b=eV8eSRzRr4ZQgYKrF6sA8R2PoZlaAj01egN8zcK/Cg0WuEoOQTKa0lza13VERYd9LBP8jZpTtXCzaPuLN0WpV8Bt8yw4TZyCrwu0v/s8HDK9/l+ZG3LaBSrzPOTEicvxGoVwjDehcuNf1SIudc3feDW8qXjG0APK4LrJQE/bx6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049441; c=relaxed/simple;
	bh=ArDByZmc9csepA9CgZHxb5udyEDuHBpra4BchbwKAAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFGOXcK4ei1et+p5cD5YtJmfqwVG7Gsfi/fH3Oa5/r1nFOiRKlh1g5uQitTJjo7hkOX5kSDAJMRXsl4apQUPfeMRoLV9QlyuMTdrmyTeXyiH1IJ9unoLvl6J1LrtZQUJ7b/UwFN21l4lC0bBQi2UTl4nRDJ8vLHf4CFpdyo0jEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9vpqXLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/7l0Bur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9vpqXLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/7l0Bur"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAdii1206228
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RHVAAusaXxeQXX0sh5hgTNs/wTLofhUSlbBBflIiB8=; b=j9vpqXLcq3UCn70u
	MptbTjSVyuO5QfS6c5Mt4IqQt7ODSmXjCxXb6zzAcquG3QatuhRkWE7p3+EQ2K9/
	HH9Xx4NXutZ0ZqKZisjB10iqw5MiM14aB1+41jl2mxUveSzEQLMkvT1G00yLW8lI
	Lp97zuSuMksFjpxUQUUx5vt1POL/LyKrcz7HjepjaD0ZgPtwMVBLmD4HTnvQBdR1
	tpDMedJI1xmyjV0EGXNkikagRiNZtVKeTz2YfLFPfEWFASudYcZ8VbamoM1LBdO6
	PqbRsrhXGUT4RD0FLxN1vCILMQysjD0dF8wPYUeHy9pUqjok7J3RSGKXtMg/PyFY
	YCS1bw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9hr0re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484ba00601so1650399b3a.1
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049438; x=1784654238; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RHVAAusaXxeQXX0sh5hgTNs/wTLofhUSlbBBflIiB8=;
        b=K/7l0BurF9ruZBaoeKwjBgMLUo8JcArnkGzWIvXUwlEhh8Wq1odEayjnWw+BPMCeXl
         wv2e5aulZyQn0bVfs6aG7EediqSFPz6qxKDtvih39Evv36dUVFp4WTYqUJTVwxwUnGgF
         dcZwdnPL+BFsH3IxMUynjFQ6vvcGMECNEPJr5jJBKGjjPDfLsXvG7oQxi2rZ+vDAItxM
         /wliNt31vPYXDZz+qZIX0sFAOiJUiN9U6UQrz9s8a86J9Im/+7y/9C0XcpN5v204bUpB
         rgaVT4hoSsgXG7ZndtHWpFz+haaw2fQGjsAb5dfLUcN9TPNT1wYtSHhqTB3klOma3kxj
         JkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049438; x=1784654238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RHVAAusaXxeQXX0sh5hgTNs/wTLofhUSlbBBflIiB8=;
        b=sZxKnaTnqW6+w+uNuutXmLJFtcaY2ZvaS7UiOBbSgtG5JuSGMYA0K/Us60o58bHNOe
         cSCfMBXnyabWDcIFUxfUv+B3ai9AZ/eukib5+yjCbiWaiJ2roGwQvVgzu5VY6G2LTSm0
         V430056D8fdUyrmbQ0DnHXz/Tl1mIv7owDHtVmDKmqm1d29/TwvlLoCU76Teorm6btMJ
         HbpI2WtpkJB6TtZ0XmTr9BITFmCVhOOTuMcgg18bdZwbMMWP1XHovSJVq7Kd1iicG/1O
         MpNW2qr6Gez+t0DqMP8r0KsdbzjoNnawO5ALq9c0oXHO4FAPaGSkKrqVms451z+75poq
         M9bA==
X-Forwarded-Encrypted: i=1; AHgh+RpXHMX0LP7QM/zlelNa1BWArXMvD7OLVsBEPA4164r4ocSFNowCdcUSnxKzHDKPPmqdMG4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgcBMkx1i/xknWjFTZToAiAejATYmslos3TBfCYopi2oJ4F2e5
	lbCEcmIcGwo097f52tyFuhx/uggL6w2g/gnm/LzQ/ZT1vy8PU2X0B+NnuSfoD/Taas+JAE/MsLY
	ML1tHOxXskXezrOFnr0tnqCid+xoiCh9POwPPyGBrAYrEyvIRvZxlxg0=
X-Gm-Gg: AfdE7clL1df0EtiF/0FKDnWRDCWGdfkWY51Tp5YRis8QLGYlFleu2v8sYvHU2BlFfZ3
	4fpFsBR3BtaJpZZ7EpgXnSCi6r310Agm8hDIf7ZDtmbEnKU6UtSJkZ1sMnioUI1iQLSTzSxAqWb
	EJct+yStPvd8Fas3ka52gXoj1hWGQI03bQGJ0RslShzYSKMTH2JHSYY8BdEX6Zl8qBneYLxE8Tg
	XGZ6XkrCoxnvQRLDCwlfKOc/MWLKIPcbo6y7w8aO8ARtyrn0BccNj+MPN48J8zawtv0LwEOS2I/
	5jHRCewPlgn57rH/ccDKLepeIIrtH/KfREPDVSbJZj6izZhdNPE6DBVKyGOQ3uMj6uAKs+8wJ6d
	wP6yPC927d6J47CaOZN0U87T6jX70beu8tOTBovsfd2ONL3g=
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12964241b3a.36.1784049438086;
        Tue, 14 Jul 2026 10:17:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12964194b3a.36.1784049437398;
        Tue, 14 Jul 2026 10:17:17 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:17 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:31 +0530
Subject: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=13281;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ArDByZmc9csepA9CgZHxb5udyEDuHBpra4BchbwKAAw=;
 b=XkgmIxYqF2biUxhGTDhazu1bx4+168Trm1jCPnrjets3o17sJQbSvBWrR9IfVOIVER3v9BIz7
 E/fRP7x6CLaB4UJJT7p622harlN38F82A04WOOEnhnQ9cff6bPQf3Bn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a566f1f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QUVuacwPHT3dDyYMSdgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: WcS0YUJ0Ezj1j8fF_1IBfoRmODIx1Sgy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3NyBTYWx0ZWRfX/SRspAfxtEn/
 5iOViDEBSW8iv0MpACZ1ypy+fnaLkVy+AQ9pWpceur8hPalnWfa8s8MrAfpObCKQBTjTZgKMLn2
 zsggoZkdXR6KofnSvTKs+S57i2OKWXQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3NyBTYWx0ZWRfX8t5n74WFnJfB
 bIyVrXHwkP29BtYr7ASHjPHM9VQA0DBzadzEXo0LLSySFftOPGqlBXHA88wuGh0m1exobjk2rbi
 Co9E0tYUym9EairQ8/LjsvMf0EAnSkVayebnr6oDHBOfp8QYC9Mq/DNFCupm2f1R4iAFYsPHRDE
 jYkIk7aZlKpta/OvV1sPV6we5pOevz+4DIx2AZVtDHNH9wHY4tWruqRvU5yTb6IbCbqXsYP/9+v
 UpQjcORdbvsQVjKhkl2ITtlz9KkIeLsQSr2eiTxR8fDAdPfB76ogwwRI0kc5zFQFBbQ7PjcWecV
 SwYeSvqojkk2xdviJRoS3xr3tqNdxck0/8Y1uowizVpfiXIG8lF5iXe1lyHJYhLSfGeawnnS16K
 AqcOFnh+mE6DO+b2+an/squV10pqn6TrtIqRPPwY/xnAjptUMqC/xUb03P2T7htTg0JAodzXOwa
 sKLKKmWzgfVvb5BkMeQ==
X-Proofpoint-GUID: WcS0YUJ0Ezj1j8fF_1IBfoRmODIx1Sgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140177

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Extend the reboot-mode framework to handle predefined modes alongside
those defined in device tree. Drivers can now define their own
reboot-modes and register them via the framework. A centralized init
call has been added to the reboot-mode framework and adopted by
existing drivers. This ensures driver state is initialized together
with predefined modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |   4 +-
 drivers/power/reset/qcom-pon.c           |   4 +-
 drivers/power/reset/reboot-mode.c        | 192 ++++++++++++++++++++++++-------
 drivers/power/reset/syscon-reboot-mode.c |   4 +-
 include/linux/reboot-mode.h              |  16 +++
 5 files changed, 175 insertions(+), 45 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index ac69b5f39fb4..4909c65ca02d 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -53,8 +53,8 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 	if (!nvmem_rbm)
 		return -ENOMEM;
 
-	nvmem_rbm->reboot.dev = &pdev->dev;
-	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	reboot_mode_driver_init(&nvmem_rbm->reboot, &pdev->dev,
+				nvmem_reboot_mode_write);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index a508ab26d03f..5f3c6002ef8a 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -72,9 +72,9 @@ static int qcom_pon_probe(struct platform_device *pdev)
 	reason_shift = (long)of_device_get_match_data(&pdev->dev);
 
 	if (reason_shift != NO_REASON_SHIFT) {
-		pon->reboot_mode.dev = &pdev->dev;
+		reboot_mode_driver_init(&pon->reboot_mode, &pdev->dev,
+					qcom_pon_reboot_mode_write);
 		pon->reason_shift = reason_shift;
-		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index db2129c72341..08d5b58fce71 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -32,18 +32,30 @@ struct reboot_mode_sysfs_data {
 	struct list_head head;
 };
 
-static inline void reboot_mode_release_list(struct reboot_mode_sysfs_data *priv)
+static inline void reboot_mode_release_list(struct list_head *head)
 {
 	struct mode_info *info;
 	struct mode_info *next;
 
-	list_for_each_entry_safe(info, next, &priv->head, list) {
+	list_for_each_entry_safe(info, next, head, list) {
 		list_del(&info->list);
 		kfree_const(info->mode);
 		kfree(info);
 	}
 }
 
+/**
+ * reboot_mode_reset_predefined_modes - Remove all predefined reboot modes
+ * @reboot: reboot mode driver
+ *
+ * Reset predefined reboot modes added via reboot_mode_add_predefined_modes().
+ */
+void reboot_mode_reset_predefined_modes(struct reboot_mode_driver *reboot)
+{
+	reboot_mode_release_list(&reboot->predefined_modes);
+}
+EXPORT_SYMBOL_GPL(reboot_mode_reset_predefined_modes);
+
 static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct reboot_mode_sysfs_data *priv;
@@ -117,6 +129,58 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/**
+ * reboot_mode_driver_init - Initialize reboot-mode state
+ * @reboot: reboot mode driver object to initialize
+ * @dev: backing device
+ * @write: write callback for programming magic
+ *
+ * This function must be called with a valid @dev and @write before calling
+ * reboot_mode_register(), reboot_mode_add_predefined_modes(), or any other
+ * reboot-mode framework API.
+ */
+void reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			     struct device *dev,
+			     int (*write)(struct reboot_mode_driver *reboot, u32 *magic, int count))
+{
+	memset(reboot, 0, sizeof(*reboot));
+	reboot->dev = dev;
+	reboot->write = write;
+	INIT_LIST_HEAD(&reboot->head);
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+}
+EXPORT_SYMBOL_GPL(reboot_mode_driver_init);
+
+static struct mode_info *reboot_mode_create_info(const char *mode, const u32 *magic, int count)
+{
+	struct mode_info *info;
+
+	if (!mode || mode[0] == '\0') {
+		pr_err("invalid mode name\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	info = kzalloc_obj(*info, GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->mode = kstrdup_const(mode, GFP_KERNEL);
+	if (!info->mode) {
+		kfree(info);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	if (!memchr_inv(magic, 0, count * sizeof(u32))) {
+		pr_debug("reboot mode %s with zero magic values\n", mode);
+		info->count = -1;
+	} else {
+		memcpy(info->magic, magic, count * sizeof(u32));
+		info->count = count;
+	}
+
+	return info;
+}
+
 static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 {
 	struct reboot_mode_sysfs_data *priv;
@@ -158,7 +222,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 	return ret;
 }
@@ -171,7 +235,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info = NULL;
+	struct mode_info *info;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
@@ -179,11 +243,16 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	int count;
 	int ret;
 
+	if (reboot->reboot_notifier.notifier_call == reboot_mode_notify)
+		return -EBUSY;
+
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		memset(magic, 0, sizeof(magic));
-
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
@@ -195,35 +264,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			continue;
 		}
 
-		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info) {
-			ret = -ENOMEM;
-			goto error;
-		}
-
-		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
-			pr_debug("reboot mode %s with zero magic values\n", prop->name);
-			info->count = -1;
-		} else {
-			memcpy(info->magic, magic, count * sizeof(u32));
-			info->count = count;
-		}
-
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret =  -ENOMEM;
-			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			pr_err("invalid mode name(%s): too short!\n", prop->name);
+		info = reboot_mode_create_info(prop->name + len, magic, count);
+		if (IS_ERR(info)) {
+			ret = PTR_ERR(info);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
-		info = NULL;
 	}
 
+predefined_modes:
+	list_splice_tail_init(&reboot->predefined_modes, &reboot->head);
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
@@ -234,7 +285,6 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -267,7 +317,7 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 	if (!priv)
 		return;
 
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 }
 
@@ -277,17 +327,12 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
 	unregister_reboot_notifier(&reboot->reboot_notifier);
+	reboot->reboot_notifier.notifier_call = NULL;
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		list_del(&info->list);
-		kfree_const(info->mode);
-		kfree(info);
-	}
+	reboot_mode_release_list(&reboot->head);
+	reboot_mode_release_list(&reboot->predefined_modes);
 
 	return 0;
 }
@@ -312,8 +357,10 @@ int devm_reboot_mode_register(struct device *dev,
 	int rc;
 
 	dr = devres_alloc(devm_reboot_mode_release, sizeof(*dr), GFP_KERNEL);
-	if (!dr)
+	if (!dr) {
+		reboot_mode_reset_predefined_modes(reboot);
 		return -ENOMEM;
+	}
 
 	rc = reboot_mode_register(reboot);
 	if (rc) {
@@ -352,6 +399,73 @@ void devm_reboot_mode_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
 
+/**
+ * reboot_mode_add_predefined_modes - Add predefined reboot modes
+ * @reboot: reboot mode driver
+ * @modes: array of predefined reboot mode entries
+ * @count: number of entries in @modes
+ *
+ * Add predefined reboot modes before registration.
+ *
+ * The entire list is discarded if any mode entry is invalid. An entry
+ * with a zero or negative magic count, a NULL mode string, or a mode
+ * string containing spaces or "\n" is considered invalid.
+ *
+ * Predefined modes are cleared if registration fails.
+ * Call reboot_mode_reset_predefined_modes() if registration is not
+ * performed after adding predefined modes.
+ *
+ * @reboot must be initialized with reboot_mode_driver_init() before calling
+ * this function.
+ *
+ * Returns: 0 on success,
+ *	    -EINVAL if invalid entry is found in list,
+ *	    -EBUSY if called after reboot_mode_register() or if predefined modes
+ *	    are already set, and, -ENOMEM on allocation failures.
+ */
+int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
+				     const struct reboot_mode_entry *modes,
+				     size_t count)
+{
+	struct mode_info *info;
+	int ret;
+	size_t i;
+
+	if (reboot->reboot_notifier.notifier_call == reboot_mode_notify ||
+	    !list_empty(&reboot->predefined_modes))
+		return -EBUSY;
+
+	if (!modes || !count)
+		return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		if (modes[i].name && strpbrk(modes[i].name, "\n ")) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		if (modes[i].count <= 0 || modes[i].count > ARRAY_SIZE(modes[i].magic)) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		info = reboot_mode_create_info(modes[i].name, modes[i].magic, modes[i].count);
+		if (IS_ERR(info)) {
+			ret = PTR_ERR(info);
+			goto error;
+		}
+
+		list_add_tail(&info->list, &reboot->predefined_modes);
+	}
+
+	return 0;
+
+error:
+	reboot_mode_release_list(&reboot->predefined_modes);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reboot_mode_add_predefined_modes);
+
 static int __init reboot_mode_init(void)
 {
 	return class_register(&reboot_mode_class);
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index 983b1fbf614a..0c7e11276e6f 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -47,8 +47,8 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	if (!syscon_rbm)
 		return -ENOMEM;
 
-	syscon_rbm->reboot.dev = &pdev->dev;
-	syscon_rbm->reboot.write = syscon_reboot_mode_write;
+	reboot_mode_driver_init(&syscon_rbm->reboot, &pdev->dev,
+				syscon_reboot_mode_write);
 	syscon_rbm->mask = 0xffffffff;
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 34a81e4b4f95..b216c7595f7e 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,18 +4,34 @@
 
 #include <linux/types.h>
 
+struct reboot_mode_entry {
+	const char *name;
+	u32 magic[3];
+	int count;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, populated via reboot_mode_add_predefined_modes(). */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 
+void reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			     struct device *dev,
+			     int (*write)(struct reboot_mode_driver *reboot, u32 *magic,
+					  int count));
 int reboot_mode_register(struct reboot_mode_driver *reboot);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);
 void devm_reboot_mode_unregister(struct device *dev,
 				 struct reboot_mode_driver *reboot);
+int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
+				     const struct reboot_mode_entry *modes,
+				     size_t count);
+void reboot_mode_reset_predefined_modes(struct reboot_mode_driver *reboot);
 
 #endif

-- 
2.34.1

