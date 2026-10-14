Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8F94C14E9
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980163; cv=none; b=XMupBzAwSwuoOTSF57cD844IoUjli5pEZ2sqvOJuJ8+yElR0hSRYYNXoHsIIxtl572zTNQgI8Aq4MOkiPct6loI9D2wfjSMb48ZNUkbzPKJhRSETdZ/lPnMgzSJSRpHxNFKSdPq8U6tjTIN/wpuXDNQxHiooMu0iT3qZe43Am1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980163; c=relaxed/simple;
	bh=l5oEal4VAJKhbsdVKhFkkLQTTN9gxEOa+mODKSDfhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Swvz+54Iima49ICyXAJRQXwHdlFCNeJ5/ccVHdQW4BIqWRhyjXdzR4S5a5RLYKWDzhTOQC+QD/TnVfmkkm8qR1IE2e545xI9+Xp/GNDqKRbhu5rXMLEkb5IDpgNCVwBevS6TDD2Aqg3Z00vUwLsEJYegsitHHePB5xGv+rxtIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cq5AF0Bt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cq5AF0Bt"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2288145f8f.3
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980160; x=1792584960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=Cq5AF0Bt9mbJQzIJWURD93Ig47NqD3s/ScPegz45HSA026bk/POG5OBi+NU/IME8qE
         MCB7Lz5UPvoy6Tn4zoXOZq8HDT2+h0J/ZZm1zWCGUHfn4zACzicLeeUXYgCk8TAaGdDK
         TqVe3WKhljrF4aRQgsi5I1q9UFm0b2zFQLvCkwEBGy50W8Z9z+Qf98q6/fSBtjvrqUTN
         f+cgS4lTJxBUpb6PauasZmkl9KcO2el6CIbWJZn7QC9KBQt50g3rmfXAX6hq3nie3SD4
         oQhQzJTJ8DTInymCmq4DOpGyUHj4sFtU0N2IvdnO28dpW5W6rQO4YtYKC7mukXTz2HA+
         UILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980160; x=1792584960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=uj7zJBg4uMnMAUQLbwFmahtXwwyAyf+cytW40UTMXhl/frBKf2aAVSDVYbj/K8FdBy
         sT+7Qq++xDEKmGHcN05Zd1tV1jTuAMDDClTf9tbpEeEw9Q60/m1/FEc2fcCjOHkCSM14
         3eskELY5/i2djn0Sdusk+LdoPQHJqzNDOVKdmpMtIhAbKWy+HYL7Umvufb3ovjNgvYfL
         qpiXlUvoKRjtW/G6HtaHPLcgfT9BOh51hvtm5jtqFF7t7YJLAOdFs+Su1shlArxvH7Sg
         EbrCeVNuaN+xDuPzM7QVURWq6ZjYLrkdOaKZqe5Ewp/TBJzqb62xCjsEsryhQkB6UORC
         yBWA==
X-Forwarded-Encrypted: i=1; AKwUvBzsv77tbk+Cw+98VYGVHAJss1Dl/IYXFQlxRhvjuQ9xTooAmndbsR8bC6SuEUpnBOzvHFI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKZiVaUFpNLlTv2KsIrFubv6oKf4wVqENVMhS0Oz5NRMqzR0z4f
	U1k93UY32K7kAFRzpzmcL8D5NpgNHg/3bLrmjIoda3x5rGHHXOk2tTbV
X-Gm-Gg: AYBFou3zr2naZhiVDwl/DcMAsLEgHkIj4NwubwB/egFwBVGwA7KZ+JYChUdaDjeU9Zd
	jhcJHt/Pvcrn/tgTkDqPwxz4YVRca8z5+zwkRbsMkSIDpJskCvBiQsEgXWhRxQc2Eo7tCAHSNvP
	t+SUMQtEeJhK3F8TpQR1JV43T8COuSDEMx395bLBfIXMFfTppQodlJOYxr4u9ZjxzEMIT3Jauk1
	QjVuGVYRXGOhoHy9UbIJunEt2xRn9s28bSq2Fmedn/xJ6SDpd4HdU7/lswjhwMKlqqFzTx8sEQy
	zM4uCTaXi+UfSh7RGovkCf32aKTYF/7HlhXKg5RPTf3u/WECYiWnJF53dn41pNgrrFJMOuBUGaW
	E2V5XvR1xpvI9pXolNYIVscfSvrroHOOC4OimcpZL/LTZPhU1hzugdQGtUsSTNPZgNGbBekQU2n
	fPvbeBcAge6F5h1cnPM9JneMw6WZ1JXFn/7SBViVrhV9PVzCYIXoX+qaMflAVWC57qcnj83uVEG
	D6vuqWyzNfY5NUQCErJOCap6972bg==
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr21986456f8f.16.1791980160478;
        Wed, 14 Oct 2026 05:16:00 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm11006660f8f.36.2026.10.14.05.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:15:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/3 RESEND] mfd: max8907: Schema, pdata and poweroff
Date: Wed, 14 Oct 2026 15:15:41 +0300
Message-ID: <20261014121544.138958-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  38 +--
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 309 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

