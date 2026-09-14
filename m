Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FB9414A0A
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424335; cv=pass; b=EJo55lO+797UUA0a7XfOn/bqXwnvAqYEmOlLiI5C8bJXH/wd5lFC/0HScoWsjmM3LfpaKgAMf7S3hm+xodcyeP98/VapalPDBJzTrsZPo1Z4Kh2ZDBF7tuizSd5le3FuLyPJU58N/elZujG4NrkVhikfK2hQyZdEgj3hWAUXbRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424335; c=relaxed/simple;
	bh=jFmNWvaBAxwDm5cBVjlIlJI9ulmQUsGEij3E1B5AyR8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qhaKRD0UkzPlRO3Apy7HcVoqZdfWD0BF/L/tggPVDY1xEjKkIM1OO4Hnwe5Q+O9MybmkoyvnQpZRpIVvqlbjnCOTXZv7509BmcSlb5SDMa6KyTwUFioTXCU7IGAnswOljscMNN9TAKgbSJpmKR0o2D16bVfSG/EV4qVCYk/CfKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aioii3/g; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aioii3/g"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60b9so195910466b.0
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789424332; cv=none;
        d=google.com; s=arc-20260327;
        b=c7e1hA4A05ZwbHn10t40+kxp237ngboN88w6hzfjJaT37LCsgFMCzbN0xkMTOxGYyt
         80uj0e3h1iYUIuet/LvGxcazxKx4QTOm/KWIOgeA51c+ldTNsSgKqC+Bpc2CQaVnXUOD
         4eXxzXsBwVYRoE61KPcL0SyBFonmKnZCZd4zI6jJ7dNTbDtQwHhexdNAhw4JM8/Qivnu
         KdVhtnREfiNBfXwmGjtmhC9JAjDXelqAqUzeznvY8LdXuQoJnOAkwM5HDZX2M6QGH9GB
         PP7kon7xo+dp3hOCxdBXWwwdV+EEvQek9aW1GS0Ci5PoxXmyxg4kV96eQ+C4PlNonxRd
         O/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Dur5Fu2GMjpcmKKr2J7I2ozUvCDMZmY/nJkKClg7DFc=;
        fh=/VdoiUHO+/yacT8+PyRYpcZKcS5gGL5zhraPhGSGEyU=;
        b=ADfoUhm04BfybvBYlmmkdJQqgCApYv9O7wDZ3po7d99RNKclJfUqXJOarEtsW2Omx4
         ukclFl+LuklCdQ8POP9pTMkQcGFgzTsbbAcxCZJPiFrmleHvL8+h/2/kmcPSIvUZi1bE
         hcRsg9iCocFMyz1ka3SR2tXAQ/+Zczwx98tY8hPt/EBzmSr7UK9j4HYj0X2BwCBRQ09M
         IqTgvo+g1NWzq5RbDOhuj7tdhbkTKCMJOepGtk5tPcjU7UJzCNNSDnpUcolBC+K0LDMy
         nWbISeJkjZADCC7UVmzXk53tM2zAb5YChoH0YVSCqQeQlnqyJncqnSSZFkbZqgY8Lz8B
         T0/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789424332; x=1790029132; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dur5Fu2GMjpcmKKr2J7I2ozUvCDMZmY/nJkKClg7DFc=;
        b=Aioii3/gNdB7s8p4H30KySGh/+oZ2hgJ6AhCrEIB5NUfZZI4RIGL4mBJAVTjw7oohV
         ueykdNvx6/zWSlsvDo7McYbPx7wZyixKOEg57m6r3+yftpob6F42jBbH+B44tbzBEkPj
         CWyMcSS8BPiPOhLbCIaPgcsi2MFkUyRjR1wYukJSaX8elq/tBT6PM4CD5CJ97nQ7xXpY
         6G3ZdRVOcc7CU8+GJEl/O0Rh+Y9voMs9EvRslD1sInGn07lNFOY61uQKAV1nRMAJz+8n
         ayTRpxZFhuR9B/yjuOjFnqWGjxjubCk+ZJgLSCWbsXlMf9ZMjJTTxkTWIrPUlEY7c65Z
         4i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789424332; x=1790029132;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dur5Fu2GMjpcmKKr2J7I2ozUvCDMZmY/nJkKClg7DFc=;
        b=ghsOiYfrfLF4IzrCJaK0BbsaGd10HYD+PC3KNpuRAvG3RfFcjOrJlDpeq6D1Un/4tn
         DV0ErmEckezQY9jb1Z83jrUDQwRMKuL4Sy9le4SftgMZpKL8lNk87H9/d2qwvAtlLEQ/
         PRR7MKm2maTEDVB4+39TiWt/lIE2gk+5JB2qbWxbxQIc5hX2bS/Lt3nUFYydwBpiveI0
         +m/C5SXETsqP//+qQniWlhwhxsGFRijF4jew9EPgXJZgH4MUcXcKA0uAjvyWHz3evWs5
         z9pn8iW+bf6IwAeY/mKUV5Jxn4zxc+d8va4x5GOQpS/dYQZFa8Yxtg5TWTR4T+NQe8lN
         /VQg==
X-Forwarded-Encrypted: i=1; AKwUvBw4nNMH+RYKOTLyYO5u32LJ4YMBahqIrsBpLOGsEBF4fI9bw5NH0ipvIkYgejW8l3d/57k=@lists.linux.dev
X-Gm-Message-State: AFuF++m+N8c6ZtcouMTKtJfbSDN5F8NwVBaL4lwi4GUeQ/FkDZeLH53h
	GHeyUWjkC/K+FFhzRLFDajTs8BBKNxKhnWa3Z+qQf+FtLGACh71dKWanyCnBpv/Z3dBRqVqsqm/
	IBlyHm3zbdDCr5EPiY+4BR2yXs36wbVl8yNF1FQ==
X-Gm-Gg: AYBFou358sXGAZV9o/zPWL6OnBtXGe4XAfJZYH8xtnNzwLrJ8OyW1CcN1djvwXgeVLe
	/Flcd3VV/q+d3IaNCoDChe0la3B9lLU5VURxGYgm2PfCBWN7IDeKPZS1KSLA7pCYKJ1KvQ3uk4S
	hphcZTozu1h2bcN5Wh15siKqL2/5siRY0YzbxIdKF0UYVF7g3PedH4H82HwnT4zY5CQQpWO6NNi
	56+vYvPijTJWoK3oqS47Cs9v1bucLkBjhRnpCNVFS41LJQ8jYRbtz0QoHFEVekcL0xsQ3PRcY5K
	VXGIw05ZfiGrYQLVrux4gbJEDVDgVJINbOrcz/j3FrpEsJlZCnt8z2MetA+8/nNzW4SEvjMno1y
	HBImfrQTbiEMTNmvS6XaIVyV2/Gx00GPmUch0GURzo0xzdN7aVIAl/uxJbbrJc7hj
X-Received: by 2002:a17:907:72d5:b0:c25:f7db:4bee with SMTP id
 a640c23a62f3a-c29c8b863b8mr101080666b.20.1789424332207; Mon, 14 Sep 2026
 15:18:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 15:18:51 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 15:18:51 -0700
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 14 Sep 2026 15:18:51 -0700
X-Gm-Features: AcwNN1VN0O7fE6bk_HKosSCAS64b94u9Tx-e4YchHq4ZThm38SfgOVDyogY331A
Message-ID: <CAGEsz8F1hk5UpR0tJ6LjnbTKTyfKAxu6E9=7TLM_ABgodF9TdQ@mail.gmail.com>
Subject: [PATCH v2] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
To: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
after registering its regmap IRQ chip.  When that succeeds, a later
mfd_add_devices() failure or driver removal leaves the wake enable
unbalanced.  Shutdown only disables IRQ handling, leaving IRQ wake enabled.

Register a managed action only after enable_irq_wake() succeeds.  Since
the action is registered after the managed regmap IRQ chip, reverse devres
order disables IRQ wake before tearing down the IRQ chip.  Keep warning and
continuing when enable_irq_wake() itself fails.

Shutdown does not release managed resources, so explicitly release the
wake-disable action there if it was registered.  This also removes the
action, preventing a second disable during subsequent managed cleanup.

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
Changes in v2:
- Capitalize the subject description.
- Use Assisted-by: LLM as requested.
- Keep devm_add_action_or_reset() on a single line.
- Release the registered wake-disable action at shutdown, skipping it if
  enabling IRQ wake failed and removing it to avoid duplicate cleanup.

 drivers/mfd/intel_soc_pmic_crc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908116a7e1924f9d78121284d1316b0..c082d7aded92eb418c0619031641a614e4989290
100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -164,6 +164,13 @@ static const struct crystal_cove_config
crystal_cove_config_cht_crc = {
 	.irq_chip = &crystal_cove_irq_chip,
 };

+static void crystal_cove_disable_irq_wake(void *data)
+{
+	struct intel_soc_pmic *pmic = data;
+
+	disable_irq_wake(pmic->irq);
+}
+
 static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 {
 	const struct crystal_cove_config *config;
@@ -195,8 +202,13 @@ static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 		return ret;

 	ret = enable_irq_wake(pmic->irq);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
+	} else {
+		ret = devm_add_action_or_reset(dev, crystal_cove_disable_irq_wake, pmic);
+		if (ret)
+			return ret;
+	}

 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
@@ -226,6 +238,9 @@ static void crystal_cove_shutdown(struct i2c_client *i2c)
 {
 	struct intel_soc_pmic *pmic = i2c_get_clientdata(i2c);

+	if (devm_is_action_added(&i2c->dev, crystal_cove_disable_irq_wake, pmic))
+		devm_release_action(&i2c->dev, crystal_cove_disable_irq_wake, pmic);
+
 	disable_irq(pmic->irq);

 	return;
