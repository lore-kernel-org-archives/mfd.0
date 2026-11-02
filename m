Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638229;
	b=exoEwVNvzBfMqgh2fGHC5Vgyb84kQ20JDE0lRu1Rpq0n5XghegtpbAucjQzs22T7qYvu
	 n16DlN7eVpO9VqeW5CKOPoWLMpNoOsotyUxnLWW+xy+ik3kbQANuHr0vSy55K4oTYoXqK
	 aXW1cSgpHEEoL6XFXMCx4GplFMNHjk4agOqxJ/cgqBDlDLp6vvEkpjsWLzshbxjIsGVOX
	 S/5u4jMeyNYV2BheI9PM6O7BPH4vk9oKvAocgRVwYGLlZA2uA++z6u3CNurZzidziP8eQ
	 coRgAZSK+Wevq3aZfBtdwrYa+ltfJQSR6z/K0Ct3cuKdFzXC7fq2yKPC9GQvEZGYUMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=;
	b=SsOxhv9uwoy3VVLdo/fPuv3zkNX9LxUb7CNkwVSNaaDpfutlPeV8C4L5vbYvmRj8emcf
	 IqVF/CeF3Sujekp9JTZXCG/ESADabYrKcWWqTbE/zj9rdsgeuoI0I35lPf7K+SSFpzsD0
	 DHxHZto5N69Mq2+g4iusSbz8jTZMoRx7HcIw5nYJ8Hmw6ingjA12le29+1KtFljG+OFRi
	 yddXxRQXMMdWKEfuakYc1l/HiiHh3Q/QnrcJlaTAmPeo1uXWGGgVRaKdep5Va+y6iKm0S
	 6ua/d6ODwLjuu1aQ9fnrYcYiBNobtjwwW4SlOLyAOZlUqYYU/9O/cgILIJMwIOfXi4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0acvVt/R";
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC371606A33E
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 16:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC371606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0acvVt/R
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6de056f06beso1405110eaf.0
        for <mfd@lists.linux.dev>; Mon, 02 Nov 2026 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638228; x=1794243028; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=;
        b=0acvVt/R2Um62MXana9umItZAhKj4zbC/onWQqdtz0vMtbGsVj3mMaKAFQ06WcSPJn
         tyfpPa3AiVAq/HgRTuKLdRdckTLHAozVZahGEgRjekpGh7PmaFdh/rsN5rqhcMZTSSe2
         cq2BWN+HBXf9EA5RGmTz+iwyy8wOARTYC/oYCnqPfLfsegsgNwszdHxlm0wuekYc0L7J
         wjDF9bNamPZZItQQrYvuRvjUlIdLlbpfuTJR4OC7VHliOg+1JxsiGf3xlvFS1ehDF/oC
         GUouFFhKCs6MN0laVL2GlEGnn7qiAqJ00Oqr0YMkiMH9uvlnYLAJvWfrto2+/+SRe4p9
         M1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638228; x=1794243028;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=;
        b=GcQ5qX/6H/4rFlDyd6L/GEZZm5TJiv3tMUnJSS8CniwKTrJSGfInuG+1ZrKdAyjQbC
         AI3aqi3PeIEaSgd+zahwKscmhxk4Xr0M9PqVXC/XIBaAOMbNMLJm0qxRs9QW9pGUt7VX
         p2aJlMst/t+80gJyWW+zboEHUC43S1ipic2x2jRXA/LU8n/N/kjOyCp1UXndRc1RyJFP
         Fs4M3qL8XpNt1hofLIoR4wZofBYqlZXyvWSzh+EvX/RUClFIt2ehFwFUeYuOtIpZaIvL
         9rcoAlncgSy7laSt9rowuUCTQkwB3vknvqpEh3pQjZvRAjwI/+6qKOs2sGM7TEG+y/IZ
         NOGw==
X-Forwarded-Encrypted: i=1; AKwUvBztbN+QM3Q7Vdwg5fi63O/+9eB/FzG7K36wzBKh/t0nq5awlOW/5axTmXFVkIZNTU6QNfU=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/8dPrguegNURTa1829vMqWC9syKLJ35XwWtJXt5abVotUJ4Zp
	+lrLj3OXpKktthBNcCaclIjCfTYWvQg5e2NJnAu7JmXfs45V8Ybm/QkS
X-Gm-Gg: AYBFou2uWFdFuSu27wUscvxF/JolVwXSN8vp/gvKOCFw9CYu6YWoko1TUKbmbzLOPw3
	6JQPYOz7VZhnH5FdUbpBNFrFARbI0BJ+3cDHeBnRg8wf3gq3KWJQl9SiPFurz0ycaQxNppe/AZy
	Cf4774i+8Y2dJYT0pxnnTcaugaUFy6OuHhrJ23XuSNXvBMX6lZWdcm8BguyYDuuxHeZQ6es/UQ3
	BCpk5gpECJClRyEWgANxm4OPs2StbaLP0hb4UCOR/siVhL6vMS1uK7+rWVfafN35vp/y8SXEQhc
	Q5kKLlbyRBWwxvUExjgLTSNuuyI8Hu2c9tBejb3ijeHsluXZ5bLN8njEBYKYPQjk4zBsZV8MnO1
	LIip9oE5G9qhQWYQVj28uVh0l9tZLg+G8++R/BhNz3+hHTcz2YTzVpzVHP09K983Kla3L/4lH9/
	i3D989KriMtXtQ5jdTAEm5C9S78tFOsltU11nS6UDMvI01wb6NZs/9B8X2xA1QwyamFKMqEvEtq
	x+lI6hmi3mH/VYiddcD2d5o7yhEwL4tvk1QFIxDjkWGm3lFf4JaoG0H1T2lfeA/d9ubqNL99Af3
	PfIKuV/TzyQU4PrggoPK3BiTo+m8mJkLwB9Elvu46mQVTIJguDgfSkhEZm6MkuENNWFGE/yzuGe
	YD0Cy2Bw6f9KY8Uulx64=
X-Received: by 2002:a05:6830:4105:b0:7df:5fc:3fd5 with SMTP id 46e09a7af769-85d362dff0bmr7694825a34.1.1793638227841;
        Mon, 02 Nov 2026 08:50:27 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:27 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Mon, 02 Nov 2026 10:50:20 -0600
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NSw6CMBAA0Ks0s2ZMP1I+K+9hWNRSYKIF0haiE
 u5uxAu4fZu3QXSBXISabRDcSpGmEWomMwZ2MGPvkFqoGUguteDyjOEWFodxcW9c5piCM57GHn3
 SqiowJItK3pEbYYXutFKlgozBHFxHz+O5NhmDgWKawutoV/HV3yC4+HNYBXKsirzsVNkWPFeX3
 ht6nOzkodn3/QO0HV2M2gAAAA==
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
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=2364;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ZOmLqEV8DHWh2DzcDPWX0yn3ibXvLVXOQgGwZxT1ZLU=;
 b=EYIi/kP66XwXIMwPN4Sc/iR0MoBldI6Gl1SwMDFNh6FS6aWjtblle3rpmua61fZlG25Jv2kBd
 XNlFeUApXDTAnJpLQ4whIOSoDkCLs66sO0N9UcNyu4N9A7PTHVFlJuw
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
Changes in v2:
- rtc: check for #clock-cells before reading the driver data, which is
  NULL when the PMIC has no RTC node, as on mt8173-evb (Sashiko)
- dt-bindings: add Krzysztof's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com

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

