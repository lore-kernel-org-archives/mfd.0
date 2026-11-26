Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689024;
	b=pOtnV48nvZgPsOEWlfvcIbWDzniwoM7+PsGDYwacmxxhcUsvggZrtIfVFmZUvLEaiLtW
	 ybUM6sxAZvxf2c1UGP63pMh9BK5m6VZxHEmk7HevUWcb7DjYlmvlLEaI6+4OiTYFq2M16
	 MAcLQRZNLwnhggb4HVNbZFFs26Qa62SmKozz5gfP01YB3060OOCc8JFFopK9bEkyOMz9m
	 jlRCH8KWdqdESv12KpZ6/K9q8S/Gw93vYJXBG2InX98c4rv6rTOEPu9/4pxkflnzaP094
	 x08fZcWhP32Y4bxDgWWeJbaSq9ImBqL/t1yXiEncSKx5BKgVKIabEoSkTmb+MlfqCHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=vJxNJoJMMyX6l0IUefGOFKwu/dnBh0wOlecLAsXII5Q=;
	b=jp5qeWLz31sqIn0ZOZEjt+qveehvcab5+cMWptAANFB0wFY/O5YvOvKnzoLwV2fcGnq5
	 GrGkaHe80iUjKKUPcpo29dkc9cKcUL46NFCHNdbJ8kq0NhiSyP8W5zGaEmRdV/S9R0aC+
	 eW+UII0QJJKh52I7xUMS0DNXkd4QPULNsa3zlAZXYVN50mPnTv08ImFsyhV0XUYY5ZVKS
	 /VMXKlo08WBPl63zu2DnbjpUwwyyrxd4NI31EX9tbQ5kPWKn5mr9+gJquqbG0aDnYHwpH
	 9+3uI9Ctd/txi7NHUzBp+mGWTOk3onqJPFeQWIhR9RdkrpgEuq6g8MNZsoeQIvPrhRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hlYeBDV+;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE48606A6AB
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE48606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hlYeBDV+
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1394366366b.1
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 02:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795689018; x=1796293818; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vJxNJoJMMyX6l0IUefGOFKwu/dnBh0wOlecLAsXII5Q=;
        b=hlYeBDV+FRQ71Q3V2bbY/0YSaV4tRlfhomV/96rjfuAS7ux2TPvhetbgnnMJoktuMV
         7v4n8wzD62t3hIaUemuZpl7GAmtmtLoRjNN5T/7Wfei8HZlowTY0VsBFEP4EDthAgnFA
         o9ue20NI7dZsly+XjfiHnaJPszU1f5FQdmZ8nwHwLjQqt4479vEr9fyp8/iR38IsUnwd
         I7qbzsmA95/GFRm91Qux3n0zr62Y0j53NxQt+/lfrzmEuj1VzwdOgFqahCRTVrZ+hp2c
         STrALA5GPn5x9TOU31tAWEra+vQSv0ccGDIDEbLlTr92/7+zR9+h6noUN8C5u9PdYIRp
         tYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689018; x=1796293818;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vJxNJoJMMyX6l0IUefGOFKwu/dnBh0wOlecLAsXII5Q=;
        b=w8bloByUOoY4jSUJp1eMFgcrR7ySJzebg9rHq5r8x4kXvKfWF/cgENjmFq+QZzWEy/
         /T37UuHrBLaFH6HiEvAHeprJEKwjnI/LSJq5DnUWSJHX67JnvXw8W3U/+SFTkpuIEH7f
         72Kxhsa3uRr5QM4UpwgEjqzdkKYgPAgxnx8RQc3WvqNPW/8IasRftUGNY1FQh493nMp/
         Ollq+Yw7fAFaeEKSqPNPso/fSjbK9mO4w7Whv6xRkTHrU9SRJdtf0t9SCnmMoNiU1P8t
         WYSq/smkPDhmwE6joX4UWvbJjsHyqH/0hAqoOON7ifaGQnRklKJHo+f8ItBdhufTNrc9
         lbnA==
X-Forwarded-Encrypted: i=1; AL+hErGBtIwqoOoQ++ml1fAGhIfMw+X+nOK3h9LesXtTMk0gcAnA+EpUOGwlhOqbXLJXFShnaso=@lists.linux.dev
X-Gm-Message-State: APuU4Z9oW89emysZYzgun/yjwABq3aml/x4lAGL5UqmBe4ECy41k0Yqg
	jYEa2LTy1uhQ6nISAleiPbk9BCyORNvmsW0RjhdhwFaPACBi8UiHVYaF/y9q9OFXX2ID5KiyndS
	klqalTso=
X-Gm-Gg: AZFdTZeUKDnaQGTrEJANbmxXdviUcO3szc89iZxzj+JBhum/FXDWTO6z8VkWi06YmUt
	3KdfDrpn2bN5Rpsfm+o0hGFkQVXUi+pJFt4y8URQ4OBAmglncBJDBLxCCAJGmRdcQahxHwH0ecL
	7XcwQgGfCjUABnX/GgXL+zJzqrI1qUNjCfkefS+Hxa0LB8ievF/4y7Tw+Mnr9jcCodSTKnhqV3M
	P8WrGRR6fUaeutwPyISsnOqLPVHsmq5RnXp4SPIAusbeEskLlYKK5aYdXFh8OBZLFVOBUCbvEHS
	kEZefz8mm7xnV9oS/qv74PoD0lJI1LPrygEwRRhdqweF/l9DMN6yvZsBUWYhFBZ/9WU4wo0/L1i
	GVrVteQixbjWznjO6mM+6FVoefcW9EOj62X8i77izFnbGTzuGkGtUxp98w1etOwrme7LFvWz//h
	imGxEtY/Bq49oX1yatTWkHpR88WnCKKHQmjZ1RYXNLOrdBDdpAQQ9HT2asz5/4fXaAeQFKjRubl
	qqc6gDNKfn5hUsvx+mLY7kBshzf5YthtyBdcGUKzx1ubiyQOs6uhRP27AR/DIti0uPl07sZCaDR
	m9yF+KmCXs2ItFI2JTNKAFd4z4Tv/yDuzhme3vS+o4I6SkFUU3fFsWYqbhfRJ11MKT0GeJIGeIr
	ArmMPzk+1fPl3OYez6g==
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr1933667066b.28.1795689018365;
        Thu, 26 Nov 2026 02:30:18 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc5396sm734524266b.58.2026.11.26.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:30:18 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 26 Nov 2026 10:30:16 +0000
Subject: [PATCH] mfd: max77759: Use REGCACHE_FLAT_S regmap caches
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-max77759-regcache-flat-s-v1-1-edfb4b93685f@linaro.org>
X-B4-Tracking: v=1; b=H4sIADgKCGsC/x3MSwqAMAwA0atI1gZMbS16FXFRa9SAP1oRQby7x
 eVbzDwQOQhHaLIHAl8SZd8SKM/Az26bGGVIBlWoikgZXN1trTU1Bp688zPjuLgTIxaajNJEZV9
 pSPkReJT7X7fd+37b844wagAAAA==
X-Change-ID: 20261125-max77759-regcache-flat-s-041524113b64
To: Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Reading /sys/kernel/debug/regmap/1-0066-charger/registers triggers a
regmap warning and prints fake zero values for unreadable register
addresses:

    max77759 1-0066: using zero-initialized flat cache, this may cause
    unexpected behavior

The top, maxq, and charger regmaps use REGCACHE_FLAT with
.num_reg_defaults_raw, so regcache_hw_init() populates only readable,
non-volatile registers and leaves unreadable register gaps (such as
0x00-0xaf in the charger regmap) invalid in the cache bitmap. When
debugfs checks regmap_printable() across the unreadable gaps,
regmap_cached() calls regcache_flat_read(), which warns on unset
validity bits yet still returns 0; _regmap_read() then serves the
uninitialized 0 from the cache before checking regmap_readable().

Switch all three regmap configs to REGCACHE_FLAT_S so regcache_read()
returns -ENOENT for unpopulated addresses, allowing debugfs to skip
unreadable gaps and stray reads to fail with -EIO. Also drop
.num_reg_defaults_raw so cacheable entries are populated from hardware
on demand instead of triggering eager probe-time I2C reads across all
registers (including the 33-byte AP_DATAOUT command buffer).

Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/max77759.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 5818ee2811d1..9c6b85be8289 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -91,8 +91,7 @@ static const struct regmap_config max77759_regmap_config_top = {
 	.wr_table = &max77759_top_wr_table,
 	.rd_table = &max77759_top_rd_table,
 	.volatile_table = &max77759_top_volatile_table,
-	.num_reg_defaults_raw = MAX77759_PMIC_REG_CONTROL_FG + 1,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_FLAT_S,
 };
 
 static const struct regmap_range max77759_maxq_registers[] = {
@@ -139,8 +138,7 @@ static const struct regmap_config max77759_regmap_config_maxq = {
 	.wr_table = &max77759_maxq_wr_table,
 	.rd_table = &max77759_maxq_rd_table,
 	.volatile_table = &max77759_maxq_volatile_table,
-	.num_reg_defaults_raw = MAX77759_MAXQ_REG_UIC_SWRST + 1,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_FLAT_S,
 };
 
 static const struct regmap_range max77759_charger_registers[] = {
@@ -181,8 +179,7 @@ static const struct regmap_config max77759_regmap_config_charger = {
 	.wr_table = &max77759_charger_wr_table,
 	.rd_table = &max77759_charger_rd_table,
 	.volatile_table = &max77759_charger_volatile_table,
-	.num_reg_defaults_raw = MAX77759_CHGR_REG_CHG_CNFG_19 + 1,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_FLAT_S,
 };
 
 /*

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-max77759-regcache-flat-s-041524113b64

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

