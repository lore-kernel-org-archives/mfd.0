Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236321;
	b=mN7oahWPFJ44uA26Zj/ehHqHCfFrawBpdnVNms6FxRgfsnNNZ+OSABfrmvARtJP9Tf69
	 gmdjc88qjBhLvBm6mWBMjJkxq+TaXh8x8omTJRQBgGErXeHRKztENpi+rTshetnnTYXXN
	 YZGByLDJbasRfG4GTps9YCjBrqRnml8fu3YsYt1oeSO9lVToPDdpDdrMy5UT24nBrHJqH
	 1kSSsrtORDRxm0qtnDIECk9HKT1Kbfe80FZa8K/E3preq6OkEq83FkART5j/hNsY3zCT4
	 c9e8wXndgUZLwU0lyOVc85eJz61/R1LrUT1+ZkCYKEX9cyIB8rIG7LeC4T6a04e8mYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=seKl/U/n6NYOsgLq7EY8yxXTtms+ghjcRgX+g6eIMn4=;
	b=ZMZPtn2U/aknwccHRNBPsWA9wRi1ZkWRx6XcPSc+pFGC2BSWBJ3zN+TyEiv/8DAVzLFr
	 F2tRoc0ATXzTmGaKl7MiKRR8md8vpdpPCKT+u6vykrbukmv/DO/tJD1CyrPRx3mIDybVF
	 pszThCxWGYwNLI5U8svBMWLEL0ZD/I0Zw/dECeo1b4maFidnzdR2Am82Y4iLuPRyWvjT5
	 isUOQI6ZyqvPdpVKiDpiWMABNjIZWCyZa6r7/RYKSbEbIA6Tyby2QKNkn+9DshM0cR/RD
	 baH8p6HOc3oKwM7hKboFUMSODbuSoqJ41cuLVtoRX+ZC8xIt6nfPF2SW+wZRJUo1zdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vh7mHsG9;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCF606A321
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 14:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADCF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vh7mHsG9
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4f55a53898cso421848b6e.3
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236319; x=1794841119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=seKl/U/n6NYOsgLq7EY8yxXTtms+ghjcRgX+g6eIMn4=;
        b=vh7mHsG9bKxeeF58UeDPqX1AhaJlqV2xrr87EQINk7sb5q3tt6C3Re4nox28JKDnvV
         eMBBf6NlR61z8caXjZ90EPEOvBezBC2hAsW4gdrc+0ZLjS2Y2IGdxPY1pvDwZeLHJIlz
         Bo81xY0dWi6ko+JF+q4AYkix81S+RImrSAa5nxibaiWQzQ1wDFQX8GwjNLqI3zXy/PFf
         V/gCIO27PrvleOv4Os7tX/nD6/kqF/eygSAm+ff6ohQ5SqtkMugKCnCyMg2HAsBAeQbB
         YqhwxOhyqtKwnpyRgzduald9LaDN2U3Qrgl5TeO/T7YTc8ycBMIWXFWIFtPUI56VnR0l
         BcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236319; x=1794841119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seKl/U/n6NYOsgLq7EY8yxXTtms+ghjcRgX+g6eIMn4=;
        b=YaHSMx+/jz3oiA0UNYEEGsZHvVamHM7RQqS3RDrXZ1sguBPvhf6lN0pent4b9iedKd
         dUVlBsDoTGYYFL8J1sTqnEpK1XjCjlVlYInO9rPZGuhBfp2hqQp+lqWQ28jSd6ZMi9wV
         sp6eh4bfzSpELRki8QGwdYExLxzUyjpi15q9Kn2Xl87VhIi26XmlmAz5shAkGoGVzTy9
         dZd7/eC2TmVSoS0RDkay0yyOVKy79wqfbFIYV+ZATl2xOpfFNHBUywhJqxxdpYsdCZ7m
         jxaF3mzYA22TTcMNQlAoAkGkLZ20PZuEraRM0VE4eK7zixS17uYwJCL1q5Svlb5HHGuG
         EwmQ==
X-Gm-Message-State: APuU4Z8M9RNYYPrM7u4PBe49ccHzjZEUiBGMHis8gJ0okXLSADuvzBh5
	JEFcGkUrjh+xNSUBx1WAzsLo0VjCbhU/3uATpbpyvUTVKxSj69CwDCDl
X-Gm-Gg: AYBFou1tS1Cu5ZRWN376LWg4D28qk6xPkkI2MrE/lr22NbLkUEgzWZYl0p+kxIaRgOO
	JITQpwqiXwHrljOtoMV+IZ1UuHd4KrxACgB7krJEYDnj52DUyKZ5QEjeuT3oljz9QGic8aIuiJS
	s73IaoBxvpOXlZOOc5rjlgRmlFRAYRkh653We41B0RapajFzhHWp2fMvSUKjurDGiaxQ+CEGOPN
	4i3Zl3ZaPItX9DSJtMPLwx97+wiU7IBpww4Z90FkHMj6t4+BCPGcLFvzsizRbtSG78Axiad51G+
	g73cAUPbJMe0KDOir/saiArd92pr2ZpoQXeoy90cTddjLEH9kxl91pevOzbOng4zERuX74fOsf2
	+4hr+DLNH08E13GORf9kNelBzhiBxgSNcy9+N6biLDjyd7cQljRoKD4v65OthzG+5R4DdQwgYcL
	AGDrxjmhXK0M6m2uHF0y91mFGHYlhOvG20mG3n/dbixFVNBRhDv4Jk0p+TH1Pg136p36c2wdJL2
	UU1YqfPdKUBOHpgnyhy8TTXykpQ3n+9xVf/sx5Y7ZuZncf72Q0IslOMJ8hfHHzeqSYH1R88cV1w
	f+DNqjAgw8Mm3iOKUR1fj5eT/CHSRA==
X-Received: by 2002:a05:6808:690b:b0:53c:7298:3598 with SMTP id 5614622812f47-568145b6024mr3083943b6e.31.1794236318918;
        Mon, 09 Nov 2026 06:58:38 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm4667618b6e.16.2026.11.09.06.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:58:38 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 0/7] Fix Incorrect State of Charge for RK817
Date: Mon,  9 Nov 2026 08:58:26 -0600
Message-ID: <20261109145833.1363319-1-macroalpha82@gmail.com>
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

 drivers/power/supply/rk817_charger.c | 329 ++++++++++++++++++++-------
 include/linux/mfd/rk808.h            |   3 +
 2 files changed, 247 insertions(+), 85 deletions(-)

-- 
2.53.0

