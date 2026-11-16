Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854798;
	b=t0h3Bo7EDPkmKEP+QwMARwaJl3zLY6Pt61RIctwHWtorrBE/1kv7M0PlU1IBnLljwOd8
	 opIzUvG87ljIcrYbOAJ/t4l4R0yJgz0qc6eNy85vtWMJB0awYg+CmSTg1/OKuWS0KBl6O
	 mc/vw7d0g16tHGMlcQr7BGOXig3DqgCj7dmD+PYP3B9TxdJlgfJifF04hwG2uiZjow2yi
	 uPWS1DCwjn6nC6Nr700E1vGOf3+dtgnzqfl4JdPiMdNfBTILgYqgh8OEu9rPuxuf3R1px
	 P7ait0F/tXk6moYbwJr+zByNWVt2wEdowJv2O91MuAhY46SjwjrB6li3M3NCnFKaC7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
	b=sjaxrLjNWkwm/3ng3xeeeWgDWKVAlhqVzvqKmfEsCqHxnKg7xOfuPflehLNcxaYjr3UR
	 zhMxR+kv4xHw80hYEsN5fLK6of/vUmszzsnvQMOE59WWTQ1nTiqab9pS9eD3XQ5lcUzPV
	 /LEof3GfExXGzRyttImaKXJTMKl1k7S+BsOsarzcC7fMl6eSk2mPdpqbeN8H28JgGuwE7
	 6MMMI/yfYU1QXmzYFFArJRaP+TnhxSgo4cj/tPyAYRYsK2mrcQo0VlyJ3wUPM+moNYz5I
	 xrIF9Oe5IZe1xCpmUqAuesq5Q0scDpQfmSfry3CsdT/vqpZJrTzhV95ozGIf3dQCWAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpe2atIQ;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F66606A329
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 18:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F66606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpe2atIQ
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-539edfadfa9so1170432b6e.0
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854797; x=1795459597; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
        b=vpe2atIQB2Q72NbTgkqBCIYP5wPHvl4KSeKf2xPZ0jgf3iYiaViepturETSBBRSa7x
         HV4z+4GUOK03vGuwsh2f1m1bLnLdTXEY9ghQJgh4TiZVw8ocuSFq3N+PTBe6mLPAxemV
         oo9DWmdtf+YW5t0P+gbNM1vhN/UD6JGCuojCi4Mb74Cy4JiLC8QiFhz+zH/D7buWHReN
         8Wcj02wgwlgsRrWRpK30jOm4yQbnkD2o84OkITvCPZ/PwLdRCzXVsxNSU3ZQZ/Y7fCIE
         AGl42oCQjhBpAHfiDvxUCsyCeZOcSUyTmomPIDAHAnQvd9kMA7lOS5zADUuKKA/elcYK
         5eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854797; x=1795459597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
        b=2RraRCbtd+tJNbZHzDgPDeG25aueT9KsB/+R8mpoJV5RiMpJ2WydXDk9P2/4shJo7S
         psNKwJ4f8fHFxIaa8ZAAkBidVecfQlST/M+NXeayiBi9QS+lRQ96EGUTpR25t8yfsgzX
         gM95e3KkZ3oP4B2mt4YEp3aqGSNF7LqTF6QQk40QdEd5+dWHeiA1RhKZsyhvXgAaIA/k
         G/HWmtx1D+QioIvIijCNh4xwsf3LaeVVZ2QpiiUNJuTs5Ckh0AwaDGjqhaXWe+t9fURn
         SodzWB8AWUbg41p8gp3KnWqLTRE0na2BQcVy8UD1aEMOC1EAuDeIx5BUgCMgfJFhUEab
         fjoQ==
X-Forwarded-Encrypted: i=1; AL+hErHqYwpQvd5bkgwvDLSVy+1P90yiKDXMRNElnzufGL0mxwEY2N8MoH8i145bLwieUYnwra8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+E5BAX2lzQKYP7Y//WO+wCZ7cUjaWG10sCDaKpucCnZGX5+p10
	hbhnJqLm15RjYBwCa8lSIvqkupqs/9CZ1iMkl8H+H4ga6JH5B4IDF/ERXOfTzEgCzkVZsQ==
X-Gm-Gg: AYBFou3eUi3PlBF2h4OcH8ig+nnBB7ElS96j6QTPFvZVfKNAC2o5nW4MSE7T15Vnl5p
	biUb8ihd1iL+E83Z4SL9jTxxzzyrTAjMlWttTjGab7bqbfJLJLug/cPa2Wa3KoZ9B1B8vm2dTzO
	h7wyGXL5/LXJn3O6ToPY1fw31QgrRkOCWhHHrmtudPvLChK63nVEJiMHLq6LyP/lA1+TElbEZ5q
	51GzwkASN2xyJmtHJX5d2xJMn6mfPzRrAqd4kTmot7QdZ4dhN99+Vm/9YoIVbmR/m9+ZDiTCXWp
	pbhkFxXd4iw+91tt0kiYf6Qk5YsjTyId5DCqxGCk4kalYr83BjKYIMOaKnpFxY+0Jm93ZkqC2lx
	EHocY/73I07Iiqsw1HcEwBwdmB7Bj7w6eXIMHYkhdXiGzZsZUp0YTDFph1QHsZeGulM1G0P2N1m
	VtRAlHaVg85cg0hn3LkOo981x6mF/F81RC2WP2h3PJzRe8dGkfXpHI+lUtzD6xAWBL0KN0FJQr3
	ei+SR1naY8AaWfgZvtzfgeezRhpTspepKnZAbHPMb++qmP0L4Zu8w6XoTS2l6p2pBWdcexvsleg
	DpYNiaaqGCc+5SOV1CsSbvNZnR8oj7SlgZT4KbF17MSBU6f6yxx7jdVda97aSLSL2YtH65c6Y90
	MgyqYuobTQj29PfeZ0g1eEFpClluiPLPkMhFzTtNU
X-Received: by 2002:a05:6808:3186:b0:53c:7298:3591 with SMTP id 5614622812f47-56e5fd4852bmr9836229b6e.1.1794854797281;
        Mon, 16 Nov 2026 10:46:37 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:36 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v3 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Mon, 16 Nov 2026 12:46:32 -0600
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43Nyw6CMBBA0V9pZs2YTkcosPI/jItaCjbKIy0QH
 +HfDbhh6fYu7vlAdMG7CKX4QHCzj77voBScCLA30zUOfQWlACVVRlIdMVzD5DBO7o3TEMfgTOu
 7Btsx40JjGC2yuqM0ZCmrM+acIREwBFf75+acL4mAm49jH14bO9NafwJJ+lOYCSUWOs1rzistU
 z41rfGPg+1bWIVZ7a/q36tCiVRYo1VOKevj/rosyxeEFL37MAEAAA==
X-Change-ID: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=2739;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=edI0U8BJ05vm1zYUWZKlM1TrWGXlJBUbcmpWbDIqGNc=;
 b=NLQ9/9ifb2vqQe0on9JdNLDbVdTMhveUDIstOj4nsP4FUeFFlZdrmwfVC4+mYhCjsUQssYltO
 y+PtxNWp0vnACO+TbUGWxj431pgV6oe5TK+FwOAtVekLyd9sDVCpExb
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - LK sets the bit at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Lee has applied the binding to mfd [1], so v3 is the driver part only:
patch 1 gives the existing write trigger member a name that says what it
is, as Lee asked for the new one, and patch 2 adds the clock. Both are
for rtc.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/179459615032.87488.12726056214378307165.b4-ty@b4/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v3:
- rtc: name the new struct mtk_rtc_data member control_reg, rename wrtgr
  to write_trigger_reg in a patch of its own, and the local con to
  control (Lee)
- dt-bindings: dropped, applied by Lee
- rebased onto v7.4-rc2
- Link to v2: https://lore.kernel.org/r/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com

Changes in v2:
- rtc: check for #clock-cells before reading the driver data, which is
  NULL when the PMIC has no RTC node, as on mt8173-evb (Sashiko)
- dt-bindings: add Krzysztof's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com

---
Ryan Brue (2):
      rtc: mt6397: rename the write trigger register offset
      rtc: mt6397: provide the 32 kHz output as a clock

 drivers/rtc/rtc-mt6397.c       | 95 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/mt6397/rtc.h |  8 +++-
 2 files changed, 99 insertions(+), 4 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

