Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904603;
	b=wdWg3VsDXkg8MpfMqVIclhDG2rbL/4/aamOaxjCzZwnkJA7lVZinTfO83YfNliqZQIpf
	 ILqe3AgdIsyvSxiTDz3fGOC5Fkw4s00EzCutApUMoUiNSseefjbfom7xGbdypakawC7xc
	 oWXLYWCe9plX4N7PyX2Ic2CfazATrBHdAq530Rc3VCuGWkWKGlty+HS1BJ8JJJdajvNNE
	 sUGpHW24aGKYyYBddyUpBX/Nuwz8oMy6tpeoJ4uHzYxLCNU2tTMvIb19AubXPPHlWviYd
	 shdgBMfRVaAEWUx4EB2g3mKMrlYgpY6zklj+UZc1jj0ZkHDE5fpbM7QZiwqFmUn/duA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
	b=Ub6IeRYh9qSX60HTKlj9kDcwEMNXmxt2144nAnvhTaB1/3+3D9zv0QWAUjuPnPGZb7lf
	 s0aXpB726AprBmi/9Y0Fl+wH3/BckattzSrYzDCQT6m/sBKdEHRQkP0Y7AtIaNJbSdSga
	 Pq+/4DaHju1+KeIBXf+68NY4EHCZyJnhbUFWKo4xm9Y47IeqOvMiX5+rPs0ZZeaWQTtbo
	 DbL5Y5GVrX408aUvDIGbZ4HlVEP/a+vRI7GoyIZ8xbcNuZd99pkCh1W4SgySbWyqfJff4
	 Iq8/7dUfCkFVS2VZMaQc939jzsXO7Oci0FlSfX/40VfqBq4+Q0cpXap88n3205mguuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vj4lz0vN;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC0606A32E
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 05:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CC0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vj4lz0vN
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so3271801eec.1
        for <mfd@lists.linux.dev>; Sat, 24 Oct 2026 22:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904602; x=1793509402; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
        b=Vj4lz0vNmAFoYrkrLdHqU31uTnvfcak9JRcrqrxVXwvcon+iuMAdxZZlNZ0SrX8PoH
         29qqioV6FFGBiEYr4a0GbIFCpEEnAmRVB6CawYmhArh/oz1dZPxOmQDY4qs9a91/cNdU
         ee9z4pjBwHksrTIkZjrVK8XdELkthKdDAxCSx4litSPKIeZupeqASMFAfFMFxBtXH+PE
         vPH1AqpQjMwH2hGVS7hELxUVUTTmJ+yXI+DFamp5O04adFSfpk9GwQ+g/mZzMcfOsL+4
         Snw5hXfAdYgmaw7xxh7OEUATqa5iJV5JpThSiaToS2gVJ3PJug4bdcK7dDhKkJB3mytj
         /dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904602; x=1793509402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
        b=ZzrtM+EC46woW58ZxM9oO+ZFdOxRm6j8XXlvnfXzrTdmtemalbI/fMdVi1kar/fwZE
         TliYD+I+uj3kIPrmET+EtrXfuAGheEDKk5IdFyKwsgfcl84La3e29Q8MfuVQwjzTj8B0
         VtTY5n/phPsa+oBj83zgQdmlj5yQbI+AncA/ibnnnVh8Pj6hvDOHFrkd6cAHVDn9RsPr
         Fk0sTURmxpu4lHFsG3d3K6iKkSs+SERUTHeYBWxOGtqsfplOD4HrpRYe5xuh3oOMOCWb
         xElrl4pldwmKezyC9vAGxbps0N8GGEp1hWy0Gv5KGzqru/sd1FTHGMpk2P83uNey324B
         Vwgg==
X-Gm-Message-State: AFq9FYJPvn7zfq58HcHO9v5x03BtJmu//n2TW38YM7Bmxu6JdbvFkHYW
	C2S8Nbjbq5hHWUCdEpHqT93xdmgP3u4bKfceYMzN+Mm9gTvLYUBk3mQA
X-Gm-Gg: AYBFou2pQ2EqCNMWn/mLSQEzqJJ+vYvEaykZjaBeQmjiNnfpkqBGUyNV0CKmFN7P1dF
	+haksaSkZYzXEtIDIcDpzPFd8ha0X8uo7rkuqPkN6iSgztZdhlWw6iUIVF8KZ00U3kAIm37ZT8+
	p+rOLel+n+nvkuuL9lh699oEJy/floCW5oZnE5tVM64q3fXVsuGrJUZDUEsH1InTI4AD+PPUgyn
	Fkbfs25/RCskEmQtheU6ctmJoJ/TZYmzm/rNbs/C/RZgBm8aOfGGmSLxNoFCfqid9bbD3bhZpvR
	wLIoKZ6LPNEiJdqCyhJ6XTccI15Gwk/IsA9/15DcDE2ztNsp6moQxRvtS3bySMu667zzp5fJuU/
	rlKaWRIsiKYq+XW9UVWjLIKZTz3i2ZIyZ7XgtPxBIjaimbDuBkPwzAZ+dpizd/Ynl8jILKejXAp
	5Yrp2Eb+GwskI9X5AyAKcKB9jbYUxKUNkMvaBHTvDZgRHs7IaYrBMtb3G7aTu2vaksiWAFg8c9b
	zA9VQf4xOUpalqMS7oLsLVio7tdVMLhgycz/jyRJos+Kd6ac0oRSUHgI4XdzVfwDiMxjyuEb0e4
	WsgJLh2ZofgfrUPaGRy5knjNVWo7KLbDDMGv0DI/WAzAdcbvLgZSBlrYRtMUbtjd
X-Received: by 2002:a05:7300:88:b0:367:3d68:8480 with SMTP id 5a478bee46e88-369e81ca340mr5718435eec.0.1792904601938;
        Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:13 -0700
Subject: [PATCH v4 2/4] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert the PMIC DVS GPIO configuration from a legacy lookup table to
software properties. We use the new 'dcdc_swnodes' field in 'struct
wm831x_pdata' to pass the software node to the regulator driver.
We keep the DVS configuration parameters (control source, startup
state) in the platform data.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 2264beef6dda..d0ec7697f366 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -456,6 +456,17 @@ static struct pca953x_platform_data crag6410_pca_data = {
 	.irq_base	= -1,
 };
 
+static const struct property_entry crag_dcdc1_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios",
+			    SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag_dcdc1_swnode = {
+	.name = "wm831x-buckv-dcdc1",
+	.properties = crag_dcdc1_properties,
+};
+
 /* VDDARM is controlled by DVS1 connected to GPK(0) */
 static struct wm831x_buckv_pdata vddarm_pdata = {
 	.dvs_control_src = 1,
@@ -633,6 +644,9 @@ static struct wm831x_pdata crag_pmic_pdata = {
 		&vddint,  /* DCDC2 */
 		&vddmem,  /* DCDC3 */
 	},
+	.dcdc_swnodes = {
+		&crag_dcdc1_swnode,
+	},
 
 	.ldo = {
 		&vddsys,   /* LDO1 */
@@ -656,24 +670,6 @@ static struct wm831x_pdata crag_pmic_pdata = {
 	.touch = &touch_pdata,
 };
 
-/*
- * VDDARM is eventually ending up as a regulator hanging on the MFD cell device
- * "wm831x-buckv.1" spawn from drivers/mfd/wm831x-core.c.
- *
- * From the note on the platform data we can see that this is clearly DVS1
- * and assigned as dcdc1 resource to the MFD core which sets .id of the cell
- * spawning the DVS1 platform device to 1, then the cell platform device
- * name is calculated from 10*instance + id resulting in the device name
- * "wm831x-buckv.11"
- */
-static struct gpiod_lookup_table crag_pmic_gpiod_table = {
-	.dev_id = "wm831x-buckv.11",
-	.table = {
-		GPIO_LOOKUP("GPIOK", 0, "dvs", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
 static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },
 	{ I2C_BOARD_INFO("tca6408", 0x20),
@@ -931,7 +927,7 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
+	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));

-- 
2.56.0.257.gf7497c7d27-goog

