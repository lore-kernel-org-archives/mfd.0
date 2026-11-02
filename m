Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597634;
	b=oDFkg4ms7cj/3JW76NTTvdQYL4ZF2s/F3rWugVBtE9gGPwHqwu+VIdP8TC3cmYZ8rXwy
	 iru6Ckrr1YOTqiThV7FV28JlnneUaMiOPW/VVsmBnxWHmtu4xv+lAFJeHHrBML7IxoqhS
	 OLEw2F/b8FPvfszykydwkE7jqf39/L6m2NiDz55p55PAtA0FyC3i2aOXUqtVAt0Dop4Iy
	 UVIQlovJgXoJzVI7mTYJ7oBjc8Lm5464a6qIGXitbl47KsafoXPbkSZIZPbmK+DdB6j42
	 POdh9D5qK022wCDQn56eIUP9iT9Fmc199cV/iy0pPW7cv2xZyBZrqm7La4xcjEG2nQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=;
	b=zB52gXtgRC5mAmfV3FwzFTHwLGRbk9bZ40YN0fAH2yUoHOxTI/YczifLvhtgEQ/QUreJ
	 33EAK14CF4A58pkxmVGOD8gAvOEHLXX/zGSNCub1DSPGtdohlIzlbG3Tt0l9Q29xuwpmS
	 HPK3YsCXOa793CrfZnXjS38AeFjMk0CaqSinKzAJ6KHdgfsiZf38gNKGLGrofqVd7Rrnz
	 WSJ6lA/MHkHaOkeYOIBmqU0IeOd0lp00Im0Lv8IeDz5nFA5SKRuZG6xDI3WEQWNA8G8rF
	 XU7GrdgD0VRh+laoRLrqF9ZpVt9JlencBBpJDjy02GChOrmkqPzxkbXZvZMzmpkCq7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTbfx91Y;
	arc=none smtp.remote-ip=74.125.231.132
Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE250606A330
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 05:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE250606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTbfx91Y
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-70399d7f076so1215964eaf.1
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 21:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597633; x=1794202433; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=;
        b=YTbfx91YmFcknSoBBd7BFdTCpIwU3DEtciP39dmP0oIIN0bTOHzFgkTUKYRTi0CTON
         ogg8hXa9vYPX3b7J21LYrWZ3sljVlM9faU8nDI6lhYN5ZPnC1aN3Urksh32xymrhu+3K
         Dup/uxN3NTHDI1XVsP+vKadNdp3QxfsrO2u5dBKdVCCJ50gcAuawPUOSQfIhdnfBaPM8
         Cdd58fpH2US1av7I9ELQI3zK4XF8RUlGq2kmteej1mSWTzXrYEDE+eZthpUoKk8GhvZ2
         M6EHxmfjBg2NOZW/Y8qu/ir04T2XeYTKJGa8YUTLHoI64O6vY1/iqZrCztxnmyJNiLZf
         AAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597633; x=1794202433;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=;
        b=0VkB+F7gFT5hwgFTH3Idipzm5QPFPmyd6O7nZ1hk34NQMnMqrjks9y60xr8/JQiR2c
         3ZhqiMJkOrNmRlxz6VT2XBJVsT1cjYpOvCpUeC0r9Y0cGvmA5FwJX/um5a6fKxQkWS29
         h8ZBrBPpoSHnZ8x4o8QFxqSvNJMtqEZDrlWE+DBRga4AGvcdPp+A/zuxcp96Z2kBHmDl
         87NGOQ6mzWfAQvNCZhHI896C1FQt2PIf6Tvl3rl4wJhMizWPFmy8re7ohBZKziZEKsub
         vJOJVSVsaGfQGgeQlnnDb/cfEendWHkpD9T6EfqgXlCt1FnXsB8+gpJ84XURMj7n+PW1
         xRQw==
X-Forwarded-Encrypted: i=1; AKwUvBySk8586nK4IkyslUu3rZ5Yo6LDohNr+/+F92xjdG5V7lz0NXgnWS/nUomK+Mut41cNaBI=@lists.linux.dev
X-Gm-Message-State: AFq9FYLzqgAAB2eCa/GphRZnbtlYxkPsxMEjr43u9g5nB2+MM4laO5bd
	J8wnCKAHF4lL/PpsbpqwMJtsklWVCnnuaSxzeOMRG5gdcou+RHxZ/L4h
X-Gm-Gg: AYBFou0WJcDnnMgc2oZjyUEpfRF93MoD0DQO8ihcpFZGNNFNK7Rh1P7RBb9ayrB+LWp
	rGPog3RL6y8hS812T6UZqikJVrcde0TT8T6nsrzh8AFcmSPq9S4zLRkF0odSHSnvyAg7ZwQxPwq
	xoPFtd4huD5glCg6mOHudfnCMfeqkxewcfaAxiCdZD6uuDV2p80mv8lFnywPQeGBHEsQ33vq7QI
	ZhjIaF7Y6NF7HhpJwg/xjFuKCIdQEcBYJs+yKWleb7IpqAQPOLG5YHqBXngQcBsbJ6ucCU7+eMU
	7Wr2UyKRokgTwCX92VeLCZVNKrSal7XHzdLNSftUkp3dYgOO6cL5xGMlMD90u+l7YfVdumcRcff
	JkZl0OvtI5tZkwtYMh5NKcNOUZozK3wo1Xu1AZAU8y20xOTkK5caXpwKjCUcBwSXcHb2PkXk6Xz
	mkhko7y66PUXe1YVqVI37H5zgrLJxpvDj6rUlbI12ZqT9yWSkwJ4tuHFm0tEL8ix5D5z8B/vtat
	xPohvUSgr9q4aTqkgrgog9skWfOjOnoI8ocNZmRyy6eEtTKnge5HNH+hFPtfqQgquxWJWOT836G
	RkiUPfjgMBq8F223wJPQ1RaT
X-Received: by 2002:a05:6820:208c:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-714f24fb531mr4934585eaf.5.1793597632682;
        Sun, 01 Nov 2026 21:33:52 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:51 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Sun, 01 Nov 2026 23:33:45 -0600
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrCMAwA0KuUfC/QNqNqryJ+dDWbQVZH2oo4d
 nfBd4G3Q2UVrhDNDspvqfIqEI0bDORHKguj3CEa8NYHZ/2IOmlnrJ2/2LfalNMqZcG1BbqcUFt
 G8k+0yWUX5kB0JhgMbMqzfP7P9XYcPwxqctd3AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=2043;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+AH9smEBqnGEd7Be3eQjkLdg1eIcwhdAuP4jWupgQ64=;
 b=eov85h6Nzm1K0qbn0yx99tHtOauCX37OjFlOU3aSi5SRuzvUuLcnssjUB6YtD+fdgUHfOIXME
 oIzVcU1KxpLA/SNkK/Wou5Q7v2zxcnGEVyrhCx3FDnngfTHaWMF3e7u
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - the bit is set at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Both patches apply on top of the RTC nvmem layout pair, new in
v7.4-rc1. That pair went through both rtc and mfd, so I'd suggest these
two go through rtc only, with Lee's ack on patch 1, if that works for
everyone.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's 32 kHz output
      rtc: mt6397: provide the 32 kHz output as a clock

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  6 ++
 drivers/rtc/rtc-mt6397.c                           | 85 ++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h                     |  6 ++
 3 files changed, 97 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

