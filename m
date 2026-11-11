Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430593;
	b=5jid6Wmi7su8IP2x5xJccUVzckaM7Nd7Piey8qaGznss5dCxuxRhOxVft6MsgU/we55e
	 jpRPvvHULhvcACaWahgn2rA3QRBUGuTapoRjiNkGAhJWwLLHM/lpZhOrWDI1SOflCyF/+
	 r3LMHBMZismQwuOnKEu9KylMwL4BQt4RgQTSMKCWdiAGeANA9ZoITpexTj243MLP0QA3W
	 I3CIeutubOmz4S/UAosCP5F0gCZ6xuvImucP5waaw5O0CXADDwPc0s/yhCNfNvE/btCEW
	 LBkF+0ZNj1T5Tmc6RBn5sdHmBDgA/8LXnj/T2lHngYLrJZ7jkNgRjQaS7zA7AVT8MrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=T17Fr+e+17o1j7Dkt/Qb3JOQLQzRIyBH08kPjcz8Hbo=;
	b=rkrjBLRG0fdJuK3pR/V7SYDPGpdWdfhDnZmQRpLczwpWg0VMyTTJyXXOji0wBnmPrFsY
	 3WH1No2aAr4drnOE4BN2K0RhiCXnRrQqdJsRfTUl94czsFUrr7EV/bLSI8qj2vEJH4ECa
	 xxsTqf6U8ADvW3B1aTReJnyCNZWVXXpqlwgGY+wbi0GibEEsYm3C2AoKXdjpdBhiFNYJ3
	 6TpvnBeV11iGnVRMOx+HFjM2ncGCu8sH06C2XmRp2+Gma3QWZ4bC4K6v60reYeQfgG3fk
	 agnUm8PlmXGDP2rbt/3WhcEcUurfUTJJP2myWBbfkKDYQbHLX6DTXK4t6pv7Tq8ddYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hg28avl7;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3112606A32D
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3112606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hg28avl7
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-486f013db83so1274384fac.0
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 12:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430591; x=1795035391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T17Fr+e+17o1j7Dkt/Qb3JOQLQzRIyBH08kPjcz8Hbo=;
        b=hg28avl7XKcuk3Y8ijbDbAGf4LFJa+HdNYwCdEfTen1jlyMdn2+49YwEOV+Is1Owv0
         7DR/FMXzbK7gzBfjk6c9+onKg8u0gXvCbnkpCRPGiMHcbJYMCp57FYrj8ja/Fp/e8apg
         bAKv4+HBE9cTTHK5YVFgGkbThVUNzX5YXO8dXuCGNhV0e+LJByJ2n3pBlsLVb4+1U1d5
         CqwvrNYFLjyuVLPUjAzlosdZFkj7N1dbXtj6TkdpNZIY9txv0ZbNjuRjkGIi+gxqEJwh
         50dEQhjBSDf/t4RcLIzctgbRPAlGm99A9v14sXILcPhJqk9ktz6Pv2RDzSuZaUYN/GcH
         efxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430592; x=1795035392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T17Fr+e+17o1j7Dkt/Qb3JOQLQzRIyBH08kPjcz8Hbo=;
        b=fQxgCq4xFbjTgra9rDGpEj3x2Rtos2SAzH9aH9774156rXDOC3DlKBT+Gk1XnnWqEL
         utqIubv5KKW4KwaXN3s/aVY6vBrgQ0tYDY6/2Me6RHSbNmWunXNsU4YhpB2foCvES9re
         ZPE//SrfkAJMLgXhg0h2jSYXdIlhikoO6S+5dOGvXLEjHWDjz5Lzf/0dI649m3u2q6gb
         LOzm5BB+h+h5QDWnnoNxx82CvGq+O07g//eQXfKdweUlS+gnkQV7G7pwV70FJ77c/YeQ
         yYwU/ccpNbted2LVl4LNSJfHkRSjC90yANsUVgDBYlXWNa2vB2+V9iimyXorbzxBPZV7
         GH2g==
X-Gm-Message-State: APuU4Z/RRjh47OQenUYuglRjeSwJpu4cuHLFKcUdPlAZIZj8JkkevHiv
	zlS5tgQYSgvBRLnwf572Mhh/iO+xxgHk/uF9OQWcLDKdE8INE9+GgDd9
X-Gm-Gg: AYBFou0nDiGP0uLRWtjYKsbU5/9Ss1xk2aibLKecd/fthYkjJlZ7gSwoxqiZkoJ09B7
	dVK47IjmGZjaYiSZ2xVWeVOvv7c2X0iW4wVlMwvAEtaj86VF+xhIIFv1MPZmmYWj/HBwxKJncnC
	gcKeg/9fAJRK9PzZxnbKXBWdJZd4+GiXUyQ2QZa9JhJ2/G1u586rC7sSCfRS+XfVZOC+zhT9nl0
	gpxdgUcRnUypIGpauLQiCjNisMyiw5pBUiqxtQwLLr1ul99PMYwdfFumhvMHl0PinlqgmMMRnHp
	mdV1CNEPg3sY7T/YvrdfxK/lnjWyEBilxIl8GGB5AiqpwrdsJ5FGI0dcjOnp9TqZtpryswrsRqy
	McFt4rkJaRghjerqEtOIlDp5vIJgjyIMGcdooDBAN2leXEtZx+LKbIpJ5bUKJupnb2bQFKZQfoN
	xzz1UCf3ZkHrKypApDHxlTfKIcPEDRZOWTMFpG2q/+yPeicw6OiSnljD0LBBZPHatzq3BW+uQpS
	7i7gfw8WoXOTL+p0xYTFsgrw3UxtI4rCVAn0DIyAiaN1zRY6BxFbOsvroXkp4AKuky/Qv+VwHZX
	XtW5vHvxlNXZXG2VlUohoZhNmGOnKqjy09UxLkMj41Zg0oT2mw9X
X-Received: by 2002:a05:6808:4f06:b0:4e4:627a:e094 with SMTP id 5614622812f47-56b96194399mr3306216b6e.11.1794430591483;
        Wed, 11 Nov 2026 12:56:31 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm6564231b6e.11.2026.11.11.12.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:56:30 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 0/7] Fix Incorrect State of Charge for RK817
Date: Wed, 11 Nov 2026 14:56:20 -0600
Message-ID: <20261111205627.56652-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Users of the popular firmware RockNIX had identified a few bugs with
accurately displaying the correct state of charge for RK817 battery
devices. With the help of one user analyzing the code with Claude
they were able to identify a few potential bugs along with potential
solutions which I was then able to verify. These bugs are as follows:

1) Incorrectly clamping a value with a max of 10000 instead of 100000.
This bug caused the state of charge to sometimes read as 10% instead
of 100% as it should have.

2) Using the boot_voltage value to calibrate the battery in scenarios
where it could not be trusted. The boot_voltage register populates
immediately at power-on, and the driver would check if this value
was older than 30 minutes before using it. Unfortunately when combined
with the default behavior of the bootloader to turn the device off
when plugged in (requiring a user to explicitly power the device on)
the boot_voltage and boot_timer values were wrong. The boot voltage
would not account for any voltage added while the device was off,
and the boot_counter that tracks the time the device was off would
be reset. To fix this we changed the behavior to (outside of first-boot
scenarios) use a value saved to NVRAM, the value from the coulomb
counter directly, and an OCV lookup from the live battery voltage,
and then using those values provide an initial "guess" of the state
of charge and recalibrate with the OCV voltage once it is available.

Included in this series is another fix that would cause the battery
to drain while the system was shut down. This patch replicates the
Rockchip BSP driver to clear a shutdown register. Unlike the BSP there
is no behavior to bypass this since no boards have yet been observed
using the SYS_CAN_SD bypass on the BSP kernel.

Lastly, it has come to my attention that I misspelled "coulomb"
throughout the driver, I have included a patch to fix that.

Changes Since V3:
 - A few bugs pointed out by Sashiko bot were fixed.
 - Corrected spelling of coulomb in new function for resetting counter,
   after Sashiko pointed out I made the same mistake I just fixed in a
   prior series. Also corrected variable name to the right units.
 - Updated rk817_bat_voltage_uv() function to check for
   regmap_bulk_read success. If it fails, we return the error and then
   check later for voltage values less than 0 and treat them
   appropriately.
 - Change logic so an SoC of 0 is handled correctly when looking up
   values from the OCV table while selecting the boot SoC.

Changes Since V2:
 - Added a patch to correct the spelling of "coulomb".
 - Split off creating a new coulomb counter function into another
   patch.
 - Split off exposing the boot voltage and OCV values into another
   patch.
 - The code should be identical for series v3 as it was for series v2,
   all that changed was the spelling of coulomb and splitting one patch
   into 3. I'm keeping the ack from v2 since the code has not changed.

Changes Since V1:
 - Dropped the sleep fixes, as I would like to test them a bit more
   extensively first.
 - Dropped the devicetree parameter, as since no boards have *yet*
   needed to alter the default behavior there's no need for it.
 - Changed the behavior of how we select the initial SOC and made
   it its own function to ease in code readibility. This new method
   was tested with various boot scenarios. The average error was less
   than 5%, and in a worst case scenario where the device was
   discharged to 0%, then left to charge at the bootloader the device
   over-reported its state of charge by about 10%. When this occurred
   the device reported its SOC as 100% but that it was charging, which
   was corrected by the new OCV logic that kicked in once charging
   completed.
 - Scrapped the more complicated sleep fix in favor of simply telling
   the battery to recalibrate at full after suspend, in case of a
   counting anomaly.

Chris Morgan (7):
  power: supply: rk817-charger: correct spelling of coulomb
  power: supply: rk817-charger: Fix NVRAM SoC value
  power: supply: rk817-charger: simplify re-initializing coulomb counter
  power: supply: rk817-charger: Resolve boot state of charge from
    coulomb counter
  power: supply: rk817-charger: Expose boot voltage and OCV values
  power: supply: rk817-charger: Clear SYS_CAN_SD reg by default
  power: supply: rk817-charger: Clear full charge cal on resume

 drivers/power/supply/rk817_charger.c | 350 ++++++++++++++++++++-------
 include/linux/mfd/rk808.h            |   3 +
 2 files changed, 268 insertions(+), 85 deletions(-)

-- 
2.53.0

