Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806599;
	b=XkK+skriNlY0X8tiq61bqfRH/s/4/ZZzKlN1amjHTw1pKRGYejj83cpxKL6WQf0vv/Tf
	 34zremnBMIakFwZzbqArV1+VnDCuFtaAv6w8EwTCVVuvBqQuSjp5Kca45DTYw1rQGmnvi
	 8KE0wiSG9RMEGL9a+Y3FkRmvjCK2MjirMohm7EyDZKV3XCdeEqURG3gU50HUL7trF+zUJ
	 OPy2ji2ux1V7ykiwaq+rH62+wISR7XBJ2VjOFUYB6vEJASC6ZFG7DVdAYQPbai8KabHEM
	 rus0hZPu2N/XtvRAgGd5KQQAwQkFNodjKNldZxnRDrXqlXBHSRG8iXxj3wyGd2GAAtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U0mDUtMC+UWGZUbp+/6kngYQYdcHCcyFlHG1lR13jwk=;
	b=enY3vmJuNu+RIzL+FCdrGQtdt3VRiK1U9KCFrun1cDJTZRH53X7VntV0gAnodU11+34e
	 eFJAavqYXY7Uc/2Q16zHcd2hBuO13NBDxNcBoRSIOs4QalOoROQAoSmzbFlYAMCZEz3F5
	 wUQknMevZQV+5JhZwVyhXqvcFMxCsJGrYaV3+GUUubJa/FiFVk8jYxC2CMFVFKQdiqu5K
	 qiEEjFTHBn8ykllVSPxY6Jn7hfFwcRAzehnv6scAgnDR+X78H1rXfh8QEqEyz/AmKsnLO
	 gvRoListPHBQl8zmgif2xKqXG0a5xisQtDvlKcI72N3xYo86c/Rf0gcDU/KnKsdSohA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nES4Dn1z;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35473606A327
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35473606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nES4Dn1z
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1349265666b.2
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 11:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806597; x=1796411397; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0mDUtMC+UWGZUbp+/6kngYQYdcHCcyFlHG1lR13jwk=;
        b=nES4Dn1znp3pc0gXQ6VlSBfo2rGeG4tYo7vhEao2s+4lhGbtrXV34FwA1V8AFi4JWz
         1U1Te4RdQqDCLRkHR/Q/PBJPbSre/wHtSj1OodyoTUn/lpqOrhNAvYAtYZzNR6JnoCPo
         GVJqfpwJnlQFT7iJmv6V4AYS9vwhOLvkoayE+FawOO16b4NW1FwnuAlz+EJ9mSNnyr5R
         4qbnCIJ1POIbpa0FEhOFggIOf6DgqO0rspf0qqJsMCvJUgxgD3yukumyC0yyFDoMHpnu
         bq8PiDaUCiOohug68EIXtRuYZceScvghoyAfPt0ylKDvRYaXRgMnrMZ0t/eYP46nR4o0
         Jssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806597; x=1796411397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0mDUtMC+UWGZUbp+/6kngYQYdcHCcyFlHG1lR13jwk=;
        b=GuChkgY5o0jHkX1Hp0jyFTWILWKhnWVf+FI12xcVWXLWsZ2DA5XHwlikwA2in+anJ+
         i8wX+ZEKeaMVWgJnKVG67Y8dxDFiIUzQpYQs4+vsDgyoDebJguvW9Xpv3MDfWI2DNMA7
         F/uvKh9A/9qAZ9rFZgvk+oUs5bUIS+b3kLG3QmLHkzRKNm8YeHYvZ0nv5Y4R68V+izIq
         SCJJumnio726o5iC7GLFqugVKES9QL8H/GVsbs/cvtQQdI9iDIEBm1UBElxqZz+n0fj0
         dWZ7wuaN1fZKNXPbrOSUgPiq4NZklH6B2wRJpZkZmYNSFs1WaZww/dEbQuaflhjxIyda
         +5MA==
X-Forwarded-Encrypted: i=1; AL+hErHSs3uGVCPqRPVWekU1ZQt0guWniCu3lAhO+MLA/gbN+OY9eVNO8pFioe3AXJUyXV5rm/w=@lists.linux.dev
X-Gm-Message-State: APuU4Z+gi8u6/haISmOzcUpAd3JunYu1yVasIHsWcdbw2AmLWhoVZfO4
	ZK1ls5flRoUVXNWm1mt3Q5ZChfmceU+F69FjuosggifwJA48AvKsfjUiQCBVf21j90g=
X-Gm-Gg: AZFdTZdUkQjqSE9FGjvhNUOSrZbLkrj3rZOhH9t2VWQ+H/rijtMd4DjqGm8nk87147Y
	9aNNGEk4i4PktTa8e2x+GMXaIla5H2xvmDQZd+jdquNPLihFglTLGyNZMwgnRb5Bavd2o4l2U1K
	NvKuNSOJpfaeP9hCRdtTYYAo100BXF/NJNQW/PNaIykxBdpAX7PS9FUxGba0WMdyRrmpHCHs1Ja
	jtviJN1RNyrGFr0TaA72XahqQXdiE4/QCrdbGaFfq+WcRs9zoEq7cyU8pl20jEBWS7X6Axjy1ba
	YEj+C5AZPElE6DNexP4mrw2NsqJfjmodhjqnB5FkTQ9CCZiJEhP3mtvvtypVyN6NInYYRFtf93d
	Z7r72VDg/UTQpuLDbVHQZfxTZiIOtUGAzs8Mt59l9RpHaZYa74Bz0b8jLJ3VkWdLswAjkyAnXCh
	Vx3bN64F92gOoxck9at1ovV320YxVYAN/iZVb/QV/KwcpNZzVIlKJtR7ysXtNdoTXjIjEu0kbJ8
	Z5F27z+5N12rMniJtLWGjaJJFTYmT3PQuLcF9c6vFoglUcZOOPkYFbCjulL3rNtUg5SF+8e6oO8
	rXYVhK2VD1kBU5WWO5g+oA8oDsccUJ9A9+hiiTvGuGAZ7Y1Kl/z1r0wfoQMdIVbLjA1G2ThuKbl
	cajxxBWc46SWNe+ZYjg==
X-Received: by 2002:a17:907:a890:b0:c50:9432:b7e3 with SMTP id a640c23a62f3a-c513aace654mr2369091766b.42.1795806596623;
        Fri, 27 Nov 2026 11:09:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:54 +0000
Subject: [PATCH 3/6] power: supply: max77759: disable AUTOIBUS for
 CHGIN_ILIM
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
Message-Id: <20261127-max77759-charger-fixes-v1-3-b364a0862d72@linaro.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
In-Reply-To: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Programming CHGIN_ILIM in CHG_CNFG_09 leaves hardware automatic input
current limit selection (AUTOIBUS) in whatever state earlier firmware
left it, so the programmed input current limit depends on bootloader
setup. On Pixel 6 the bootloader already leaves CHG_CNFG_09 at 0xbb
with bit 7 set, so there is no behavioural change on the only in-tree
board, but boards whose firmware leaves AUTOIBUS enabled are not
guaranteed to honour CHGIN_ILIM.

set_input_current_limit() updates only CHGIN_ILIM (bits [6:0]) in
CHG_CNFG_09 and never sets bit 7 (NO_AUTOIBUS).

Define MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS (BIT(7)) and set it
together with CHGIN_ILIM whenever programming the input current limit.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 5 ++++-
 include/linux/mfd/max77759.h            | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index 6876ae0a8188..49ab1766cc5d 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -355,8 +355,11 @@ static int set_input_current_limit(struct max77759_charger *chg, int ilim_ua)
 	linear_range_get_selector_within(chgin_ilim_ranges, ilim_ua, &regval);
 
 	return regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_09,
+				  MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
 				  MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
-				  regval);
+				  MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
+				  FIELD_PREP(MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
+					     regval));
 }
 
 static const enum power_supply_property max77759_charger_props[] = {
diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
index 7c0b13219d51..79d248df4c9f 100644
--- a/include/linux/mfd/max77759.h
+++ b/include/linux/mfd/max77759.h
@@ -102,6 +102,7 @@
 #define MAX77759_CHGR_REG_CHG_CNFG_07                  0xc0
 #define MAX77759_CHGR_REG_CHG_CNFG_08                  0xc1
 #define MAX77759_CHGR_REG_CHG_CNFG_09                  0xc2
+#define   MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS    BIT(7)
 #define   MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM     GENMASK(6, 0)
 #define MAX77759_CHGR_REG_CHG_CNFG_10                  0xc3
 #define MAX77759_CHGR_REG_CHG_CNFG_11                  0xc4

-- 
2.56.1.839.g22a8290db9-goog

