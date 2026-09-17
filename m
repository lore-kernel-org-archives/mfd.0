Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CD3547064
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 18:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670190; cv=pass; b=ZUSCNzKzry45JhdcTScAKJALeSF8W8qnrgcES7MxWp2OwjSHBwvwq9pgu4FsxmifSadqo9KDrPrpUR7227jnYMogsuYQgHm/fEaVtmyL5y6YOCVuxvsE5y8cEJTpt2lZivQ70gaE/ETxrog3lO5WiBtVjzYbTdzU3D9cHO6KVOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670190; c=relaxed/simple;
	bh=jihWVSc+QPPY7ukg33wNgmwKvHTeZDPiEessuX+O8hQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LNK2T855DSa0k64G72DoBvna/eNudhcZ6RTifd/+ghh8fuDh0yiK5FJnyEGEX9v5q5mnWSWAZ6fh48R69M1a1m6lSxFk4ynwIspcwL2Bqa8kj8JyEzY8QHCdJu2TEAeaiZzriGPbYhCtYLHS0cvaMJSI4Lpl5TC7XY0spBasObc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4tbmiNt; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4tbmiNt"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a2b95b72so1949469a12.2
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 11:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789670187; cv=none;
        d=google.com; s=arc-20260327;
        b=aovOFehDJbmbJrFy4wf/BOoa0HXq6HqyO7L9/PXxOKa3AviWgcJvenfTinlNcpeyZG
         k7JG9wMJWPt6Va4ekEv+ZKenf/b0JBo3sKFYNB2tdY4d7pcav1PIJPeXGa2YY7k43fis
         OnANzlWg5n+r2kdYLyyZa/LWOz6/1xwoVUE3r7Kt2/q9kXBCdynbm1YrBYulViwweYaw
         8sMYuwG42CZsiy+IbgSSl/OS1iGo45g6E9kBw3ToBn6H/4nxl+heAUDM2CSJyC/u6ii5
         1kuX06G5LIbeh5re3rhOdORF1X01xBtDWRlq8wS+liX18axaRds6lFx8+9mNwYQ4RTnh
         AU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rV/x6skGKGuWX/Erv1eMnw+O/alVkmiUtIy5zTKCJJ4=;
        fh=Sb+/l8JRFeOYnNWcwkrFOkyQmnwkSTtGkeBggnl5XPo=;
        b=JcZGdJ2S6q5AXAGRLBdRfhqolMbh98a1blpjw0wdcwh/NbfdDph9FRLfXrGgXvI5F0
         zYKejUf4VgnNT3iBVIZekEaxQjlNvVljW48PFV18ZTKcZ6jPht/kuwtVlCrenqFdZTbI
         oH756EnwEpwji9aPyjCUJstLSPpuChya9SzeUwg/Umr3YYDsb9KJjl2bJW0xVqi3xdLg
         eaMZnOUS5lx5KIG5qOsv3kz57eCOuE6vQ1gW5IIAUuNYWJIvTBiKavRE0fViDvYFD8HG
         2Flp6Zkb23eo//rrbYzR3n0B4WoEK54C0LmiMqoA7Og8tfhS0ui6SN3wEVjeueGuPh9C
         V1sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789670187; x=1790274987; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rV/x6skGKGuWX/Erv1eMnw+O/alVkmiUtIy5zTKCJJ4=;
        b=J4tbmiNtsDDFErwvwz/HZy4yUGMvyJPNjbG7s59Y+F6TevYau4unl+1KMhr9cizoZ2
         rxBQTRNrwp1PQLfH4f+OVsO9f5WtsoKgGeYRRIUZhFJIs9OhyA3IsApRRCuC/gNYFvEU
         e7yoLxiPEE4vpMEH2XlhFTwARvDlqqy6FTuGqtZsZn32DUr+2x2xig4Y3X2tqGAknacq
         fcmxOftCmzn/4m876FC1FUPxNWrL37EnlM75ZPaigkoqXRYDZK7TfBVpDPuslvxVirJo
         SoKQX2fMmQyrv0Hrqhc6gRZC/ULuzu8S/LClaScFBdpRhnX8y08lir6aG89DEHf7r+j+
         RcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789670187; x=1790274987;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rV/x6skGKGuWX/Erv1eMnw+O/alVkmiUtIy5zTKCJJ4=;
        b=N7X/k5yiDExo8RUeQymS7Puo857Yx1ru5tSIaoxBnFRNXWieUANd6tSOFcXR43Eb2j
         mmYz6BTrux5dWjk3mGZiSqNotg6Vr36XfyhtBAFJqlJuJWr1M+P2CNqSndZazVnuSSMF
         f5VG/ZE4jIhJRuwQVJVDzQwlONhUAZkpZOfbkfIjsgDa0Wic0mSBVI0n2wO1UupsBQfp
         q8+4JcNIJpsReuZkM2zCEFi0fWeIyUX1sF0bQVZranAOIOeoCzv7o8T6h/ZIotOtWnI+
         wo6J1dYA8hHXvg7FjXwg6gaW1LOdJkwTIzrCeXe7jEN/dpXxvsbX2TgqjGKZuTQgVMJ0
         NsjA==
X-Forwarded-Encrypted: i=1; AKwUvBy3OCRyh9JlwMYJpnRBKrqHpi4CggUpjWwXaMKJ62pGznETuaJBWu7dxwnYvN/zSXXVGfo=@lists.linux.dev
X-Gm-Message-State: AFuF++k25tNYYgIQS58W99tvBJcdpejpaqHI23VfOZj65jb3NZ++Vh58
	rHoPKhqFu3pjHMvKuCt38eE4wG0CEqbJ3Wq+zAt476wAVN8s2HieiZxHqjw+82rsS6G/XIROFhL
	AgkDMRAwrZM5h24Hvf8ixf2pepdJpkA==
X-Gm-Gg: AYBFou0ROMUJOByVbBdNo+hKQ4Xa2IyqWO7UWinni6UOQdsbj4i4b1FAJn30/3SXw8N
	y0QO92UkY64t9RzQaUjZrGkpg3Yt4bXhe31we9ukWWrAY+kWJZ5hCaqXUKubX2vl/mslUmkvfA6
	QjnAWKgi43PMOrdzOi2U2PbaLF2l+pBrMi7mkUu9I29ToJuUdAj6UgQvd74jbHPHtD9qfow7bbS
	RmGi+Egug/v50zC7x8f4TlpFDZkeGw97lG3LOOnSqSs+rqR9HzE6vEpUiYedNF32iCLSl5Qwcqw
	cuzCv7TRZ5ctPzms06AAyn0j3o0PH7zpbCAqes9X8OrNw83wC4FSg8zO9PP2HlTxjg/JA0d7PlD
	0MYLvWz9pYm+1IlDh5wEjifVzj6BWFWJUhII8c3nyvzSazy61H59nOJTSVHaGw1Lp4A==
X-Received: by 2002:a05:6402:380c:b0:6a7:ee56:8151 with SMTP id
 4fb4d7f45d1cf-6aa22410eb0mr6223710a12.31.1789670186798; Thu, 17 Sep 2026
 11:36:26 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 13:36:25 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 13:36:25 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 13:36:25 -0500
X-Gm-Features: AcwNN1ULqe71-mtRz6p2d1X2mkQ-K-TqKoo5dGv0ERlOFdKzohIAzuWIAiUp2eE
Message-ID: <CAGEsz8GN7XObjqzMZ1KcghAKH8anMsYSU30PUJ_YXY-zDsvcpA@mail.gmail.com>
Subject: [PATCH v3] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
To: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
after registering its regmap IRQ chip. When that succeeds, a later
mfd_add_devices() failure or driver removal leaves the wake enable
unbalanced.

Record whether enable_irq_wake() succeeded and disable IRQ wake on a
subsequent mfd_add_devices() failure or driver removal. On removal, do
this after removing the MFD children and before the managed regmap IRQ
chip is released. Keep warning and continuing when enable_irq_wake()
itself fails, without attempting to disable wake in that case.

This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
variants using the INT33FD ACPI ID.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 516523846006 ("mfd: intel_soc_pmic: Core driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Replace the wake-disable devm action with a per-device success flag and
  explicit cleanup on probe failure and removal, as suggested by Andy.
- Drop the shutdown changes and the shutdown cleanup rationale. Preserve
  the existing shutdown behavior.

Changes in v2:
- Capitalize the subject description.
- Use Assisted-by: LLM as requested.
- Keep devm_add_action_or_reset() on a single line.
- Release the registered wake-disable action at shutdown, skipping it if
  enabling IRQ wake failed and removing it to avoid duplicate cleanup.

 drivers/mfd/intel_soc_pmic_crc.c   | 11 ++++++++++-
 include/linux/mfd/intel_soc_pmic.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908116a7e1924f9d78121284d1316b0..2679061f449558e327b65abb2bb4d2ae2e3d9a10
100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -197,6 +197,8 @@ static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 	ret = enable_irq_wake(pmic->irq);
 	if (ret)
 		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
+	else
+		pmic->irq_wake_enabled = true;

 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
@@ -208,18 +210,25 @@ static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, config->cell_dev,
 			      config->n_cell_devs, NULL, 0,
 			      regmap_irq_get_domain(pmic->irq_chip_data));
-	if (ret)
+	if (ret) {
 		pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
+		if (pmic->irq_wake_enabled)
+			disable_irq_wake(pmic->irq);
+	}

 	return ret;
 }

 static void crystal_cove_i2c_remove(struct i2c_client *i2c)
 {
+	struct intel_soc_pmic *pmic = i2c_get_clientdata(i2c);
+
 	/* remove crc-pwm lookup table */
 	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));

 	mfd_remove_devices(&i2c->dev);
+	if (pmic->irq_wake_enabled)
+		disable_irq_wake(pmic->irq);
 }

 static void crystal_cove_shutdown(struct i2c_client *i2c)
diff --git a/include/linux/mfd/intel_soc_pmic.h
b/include/linux/mfd/intel_soc_pmic.h
index 9ba2c1a8d836756a255487f6dceccb441b500549..07308245da28bc0d3f916ee65313ebff808ba86b
100644
--- a/include/linux/mfd/intel_soc_pmic.h
+++ b/include/linux/mfd/intel_soc_pmic.h
@@ -24,6 +24,7 @@ enum intel_cht_wc_models {
 /**
  * struct intel_soc_pmic - Intel SoC PMIC data
  * @irq: Master interrupt number of the parent PMIC device
+ * @irq_wake_enabled: Whether Crystal Cove enabled wake on the parent IRQ
  * @regmap: Pointer to the parent PMIC device regmap structure
  * @irq_chip_data: IRQ chip data for the PMIC itself
  * @irq_chip_data_pwrbtn: Chained IRQ chip data for the Power Button
@@ -37,6 +38,7 @@ enum intel_cht_wc_models {
  */
 struct intel_soc_pmic {
 	int irq;
+	bool irq_wake_enabled;
 	struct regmap *regmap;
 	struct regmap_irq_chip_data *irq_chip_data;
 	struct regmap_irq_chip_data *irq_chip_data_pwrbtn;
