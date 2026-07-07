Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8893378D77
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 05:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400497; cv=none; b=FJm0AHMM65hJAbQxPQCJazqB5Rl3bEz3ZtfQgspmSGKOy3RB2TwPgNyn4ErQRetdEBpVCGI2UlwjnXs27w/uYV157G2W25fvTGwb+qfVShjOpOpFgDY2CgSRuCP6EzmsiAtdnhciYRyLnAhnT01tz6HrC9CR4cdDImBU1uWyJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400497; c=relaxed/simple;
	bh=uQvWHHf5fxkHGu4P30JW0G490P2gB+0/OgEKX7/Op7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sihAnFdWfvH9ipjYceCEPpA09fYORJhBTdN6efgvg6tWRnAWot6Ot3l63lfgfB4zJ0lD0X1VEbOg4eGVhuaaLNe9pPNdU08zzAvpxRwJPcTG5UqKTZuEnKKT5lBLLRyoB72w8ZnJooF4TEAuWphUB2ip8am9Sf9wjqHIq6UY5QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkXTRMIg; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkXTRMIg"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8894387780so1972294a12.2
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 22:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783400495; x=1784005295; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Q9NmG0AJd6uTA8Y7Qk5XL3+maDcBfw0qPJsNnXKIuE=;
        b=GkXTRMIgBT2PO11bnbGC6EgiKp1rl/LlEjcnyU3vKJqzoabP65JyXh1fKw+o68TnE7
         l+wjry0Gqp5AOI6F8bQWG52A8x4x6RWrgralC68BUceE23sAffR+vCm2aRT/W7onpFN+
         uw12+NnNRxNA4QDZMTr1YItlU778JofLXnb1y60Sn4mJjbW7MYrD+PDWcRiPJjYtFFhQ
         owKJCAWl6M//SVTvvmuahQDfYGB5eOrkVrmbfcEl8iwTIEIH1ivzXheuUU9/Aztthj1l
         qXCICfy5WC6NAsK9obDrhEfDMLgL3SdyoGCTjIxCmcJzNaWq/6hYpLmzxZn8fvCbLRDK
         BgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400495; x=1784005295;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2Q9NmG0AJd6uTA8Y7Qk5XL3+maDcBfw0qPJsNnXKIuE=;
        b=QNydflxXUAo5/Zj4EZs+NQ1YOzuo5O9CqLU8G7o8vPCKrM++LZKymjdS77rrE8kqmP
         vSq4PeDrQlt/RmTZ3S+FWXFQGLiq7vZEHfr53rBVD664ZEwuDbrrWvYV6594ypIei29t
         dMButfruKpRPVb832jmX3xT3Q+lmdlSRcHEP5LJ222MNOcHHxMZX1Ze3je2mqamStq8T
         QlVounC51yo85e8d07VY5VPJrfzTD1Ja4XSCAHSPIpLDMcVcP8a/hzh/UpjdDd9S0s8w
         I3i3b7tN2cMbITCwjzvUQkV5pVr9G2EMrjQIR0EUfbTKcRehy7w88Q9L+KIsdYpajHWL
         qGiA==
X-Gm-Message-State: AOJu0YxJ6ZhNCTtSZ7GajwZXWPeMe06og6iQ3p0K3CP3XVpLhUTxnN5H
	qX+OaftaEm+paOrdo8HsXLBUow4R2y3IM329tvr2R9zazbFjV4j9hIebviO41Q==
X-Gm-Gg: AfdE7cmC0keWG0K6ODmk9J1pkcOeKU5WXh1YwMfKcUyGbp5L2eplabJy/r8ImaaIRUI
	/WbE/nMWBX8KbyQ03j+HTgaEu3KH46ixHUZxp+EFytTZRHCC7Ki7mX0p08jjotdXyMmGoayzrmK
	P3Mf4BVY1GhZJLxvJE7TO/zZ2fRQFmlsHcKN24nsCTZu4th3Ku+Od1ZVoxnZNjeiLJc6ZPyv4OB
	zn6smync0RmCrqKjR0pf2fYRsj9Exh4BWXZSFqersnVv5nD/ULmsiSfHBjtcs2oER3pyFpqeETR
	916Sh52ZoPYKBzDvTf+aZL0qdnAPoitcDcwgoIrdX30AD1cBUZ11fpWPFXO5hQDgo4zxjxzlpnt
	+6bJVGSJC5TfxD/fx159Rygnj4Bka1E6WHuj7axRdtpk2sOivKvXObzA+RxkkY4XQE3/B+QO63K
	sLo8MZANVWmBX3o0EBNvTByAKrKhWA/VOlmWoijyGEvl5lw2hCrGrjAh856MaDA1LmZk5MgwUvc
	VCH
X-Received: by 2002:a05:6a21:a92:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c08ef268b5mr4423586637.53.1783400494899;
        Mon, 06 Jul 2026 22:01:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm3906462c88.0.2026.07.06.22.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:01:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] mfd: ucb1x00: Convert Assabet gpio-keys to software
 nodes
Date: Mon, 06 Jul 2026 22:01:29 -0700
Message-Id: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACmITGoC/3WNyw6CMBBFf4V0bc20jRVd+R+GRR8j1Ag1nYIYw
 r8LGJcuT3LvORMjTAGJnYuJJRwChdgtIHcFc43pauTBL8wkSA1HOPDeWTECcENkLGZOry565Lp
 UzqpSeXUq2XJ+JryFcRNfqy9Tb+/o8mpbF02gHNN7Kw9i3f0i+l9kEBy4FiDRWK+Eh0vdmvDYu
 9iyap7nD86YxkDOAAAA
X-Change-ID: 20260705-ucb1x00-assabet-swnode-683cb383d398
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

This patch series converts the legacy gpio-keys platform device on the
StrongARM SA-1100 Assabet evaluation board from platform data to software
nodes and device properties.

The first patch registers a shared software node for the UCB1x00 GPIO
controller in drivers/mfd/ucb1x00-core.c, attaching its firmware node
directly to the GPIO chip prior to registration. The second patch
converts the Assabet machine subdriver to define dynamically allocated
software nodes referencing the UCB1x00 GPIO controller directly, allowing
pin bindings to be resolved via the attached firmware node without relying
on name matching.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Export ucb1x00_gpiochip_node to fix link errors when built as module.
- Fix teardown order in core driver to avoid software node use-after-free.
- Convert Assabet subdriver to use dynamically allocated software nodes
  to avoid use-after-free on module unload.
- Factor out button node removal logic into a helper.
- Link to v1: https://patch.msgid.link/20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com

---
Dmitry Torokhov (2):
      mfd: ucb1x00: Register software node for GPIO controller
      mfd: ucb1x00: Convert Assabet gpio-keys to use software nodes

 drivers/mfd/ucb1x00-assabet.c | 124 +++++++++++++++++++++++++++++++++---------
 drivers/mfd/ucb1x00-core.c    |  16 +++++-
 include/linux/mfd/ucb1x00.h   |   3 +
 3 files changed, 116 insertions(+), 27 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260705-ucb1x00-assabet-swnode-683cb383d398

Thanks.

-- 
Dmitry

