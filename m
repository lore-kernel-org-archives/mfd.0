Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504996;
	b=ybxQjkDrL7JJ6eoyFJWwTizHJ3PUR5jfgdTnCISrcihZO/eb34siYOYRTqVdBJlwm2B4
	 dvB8+PEiGECs6SoMIvXfyppCCkr5utAs/MKRDEdSXvpFWNhXyfCO9e1CNg3Zx9O8hXp7z
	 /Qwm/XTbcOw4y4uldmEcfcXZC1FJPPETnx7g3BVz4SWw77cg5JfZ9SNMXbqKKwYeUD497
	 nIyTNloMWFS594VLuzz/pvxjMGOwanUxERJQviXOA/t/Up+0jm8uP+hbdChjABuI03lcv
	 D88Ku8QN94vXUnfrrXLsN55S+QXfokb0dFAvaoo5GdBU2o1W/wW0Ahok8/OV1v1cIFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=;
	b=k4x7vVyowAQLjLnbd6p3yFyXaR66sc3OXGccp7ZFcvZceA+BrY0PDSSwnitw0w0KfmIL
	 4F8FVoZKNnzm3DHoJyIuFrVvPiLbUWpAbinXeSJAXEulp49QusUDjbmNrlFGpB+33wyAh
	 5NoRYvGC8RtzWs0cwGBOR7WFTbumH3BLo2thPR5jGPfvqQ6YIIS9BEjhbNBzRE4pXTgSK
	 ARKJqvZ3DyWoYIYp6OOMKCxW9m/+ueDyGpb7Z6B2sSG8zgfqUXoNqCxGvXcy9f9DKRsqV
	 tn1VGNR7t7//Gf8+p8zFM6ljLxposkSwactkuqE0SXdp0ZD1tH18IOM4NMb9H5o900g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BC2Lo3WY;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7C606A31B
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 14:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E7C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BC2Lo3WY
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e977109392so15209735ad.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504994; x=1793109794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=;
        b=BC2Lo3WYC3zZdEdjxeDVzkMc7w7qcmgAVSuLRFrrxsP/gTdQM+pDjB2S9fN034tN+z
         FP9XHg9E7a3xHDQ87gtGZsVKy9Qq2n40xFtHL0L+awrRjGD87u05djra1ZmkYHp1Xln4
         bW3dBgEXXgVauTlXasymbb0HCCOWogLJta/zlpK2PXjGuziemNotj7dzLAk134TpOQ80
         M7xMcDx0OH0YdSFZXrZAzNI8UnQ6JrYr7IHIs08SbkSZKK6MziurpshlBND7LgyEQbkw
         iTpHocX7AyPBd+GUTNhD/F+ePrqe9rnK9cAjcFD/d0yALV+wfbkQx4b+tuVSh7Q6Gsyd
         N73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504994; x=1793109794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=;
        b=b76qtEndrZ8FB0ZXkzpqMQnv4X/I+HKgrVJf8Xyamrl4wUKjKCRwIVML+ZDLdavuWP
         fcRXUT03P2OJCHFp8NZZ3cesuO0+2vpPtXfG22EW7KHL4+oqY6SHtmPlmrc7L4B4jUyB
         C/ZuPvpT435LOfRquTudP4P7mF+ED6kQ5hd2tqQ0aqqyDJ3r8LIQLMIt07Dnup4/dGbG
         nO9PojQoNE67NQlu2VNRivWtgDIITxMUDsKTum4k/9waMrtIv8s5q2Sp6DSE8iU3/W5S
         HCG5RD1TtnipI/WyKwrpYEdljdsbCe6kwtVvVuz65DxTRfbZPiUBxudBXC60N0qXmwwk
         BlfA==
X-Forwarded-Encrypted: i=1; AKwUvBw5z61U6BGrcmeYNWlIj8RJrx/Rmn8USL0XPTe+4iGvUvAhRyf6BAwzbiRmyY1NuE82ErA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJoECOsfXr5YQryHP5LEzjnALnaCefLqo0ij9GYeSYuWigByraU
	+SuxgXvVXqO4LIG5+D35JR+dj5tgcJYLsESVdBuNL8/UjfR3KtyZwy87
X-Gm-Gg: AYBFou2BhHknxaU71GvMnazGhsb7wt7hKWfzCHBMNusYQuuXQ2yDQ9QkOfXYqzyqtwH
	mV8jwgHP1Brf49svSdfua6z7kChYejICHFvDr7xAY/nDz5yHlMX8bDvL8F49VXzEzcsP9Ug6LSh
	1Dqkv8yDky4dyv2UwLjo8D0cZ/0Pu4iT6Jol10W9qWqQJLhBGt9TZ/VUxEkHgB6VpTBdhlO+wVE
	Lnp8lfXR+9uaazTmguXI8NZCdKLZd/PfZWCmNGgrYYkv34lsqlDPVpDcD9CGxfROPc3prW1rEb0
	K6pIImnHRLFa3Sa+B5mgE46BLdqt5guMztMbIO9wnnB3ZklTdMNSIsAozOVk82sH009oGGvIkLO
	f3fpGLyvmCHdnc6o0/o/1lZATp0q469Cf/yhodfLkTU1QqyXf5fiCbJw8x5fIMlYxqr/SfSAte9
	gascGrZrYAKtQ0KqoTq4e5xmweN85BNZk6QMZd5T4FCGZFqY2/0ei5VNTmaHv1XxIqvG5vaX3Vd
	DhhPPk4VFZvqxPSXSNgPmUIkRzRM0aZXHoAfv5H4RYOSswRUZPFes6zTYdTVoD0zeyQ
X-Received: by 2002:a17:902:fc87:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2e9a6d28584mr100035065ad.32.1792504994035;
        Tue, 20 Oct 2026 07:03:14 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:13 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v4 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Tue, 20 Oct 2026 22:01:11 +0800
Message-ID: <20261020140127.720-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

On the Firefly-RK3399, "poweroff" drops the rails and immediately brings
them back up, so the board reboots instead of staying off. This series
describes the SoC line that has to be released before the RK808 shutdown
write, and lets the rk8xx driver release it.

v3: https://lore.kernel.org/all/20260929140649.55-1-yaozhonguwl@gmail.com/
v2: https://lore.kernel.org/all/20260919122930.1418-1-yaozhonguwl@gmail.com/
v1: https://lore.kernel.org/all/20260909092728.1859-1-yaozhonguwl@gmail.com/

Changes since v3
----------------

* No longer an RFC (Lee). v3 was one because the patched kernel had never
  been booted; the driver had only been exercised through an out-of-tree
  module doing the same calls. It now has: the board's own kernel was
  rebuilt with 2/3 applied, with one unrelated RK3588-only patch left out
  as described below, and the power-off was tested with it, including the
  GPIO claim at probe that the module could not cover. See Testing.

* 1/3 adds the properties to all seven RK8xx schemas, not just rk808
  (Sashiko). rk8xx_probe() reads them for every variant that is the system
  power controller. Each schema gets the dependency on whichever spellings
  of system-power-controller it allows: rk805, rk808, rk817 and rk818 also
  accept the deprecated rockchip,system-power-controller, rk801, rk806 and
  rk816 do not. The subject prefix is now "rk8xx".

* 1/3 also documents that the lines are released in the order listed,
  with one settle delay after the last of them.

* 3/3: the commit message now also says what happens when pwm-backlight
  is not bound (Sashiko): nothing claims GPIO1_B5 then, and on this board
  it reads low, which was tested, but that is not guaranteed in general.

The Sashiko replies are in the v3 thread. 2/3 is unchanged.

The problem
-----------

U-Boot reports the restart as a power-on reset.

Firefly's BSP drives two SoC pins low during shutdown, before writing the
RK808's shutdown bit: GPIO1_D0 and GPIO1_B5. Mainline does not describe
GPIO1_D0 at all, so nothing ever drives it.

What was established on the board is the sequence, not what happens inside
the PMIC. In the cases tested, the shutdown stuck when GPIO1_D0 went from
high to low during power-off prepare, with GPIO1_B5 low, and the shutdown
bit was written after a settle delay. It did not stick when GPIO1_D0 was
never driven, or when GPIO1_B5 was held high. With the backlight bound,
pwm-backlight's shutdown callback drives GPIO1_B5 low in device_shutdown(),
before the PMIC's handler runs, so only GPIO1_D0 needs to be described.

Prior art
---------

The vendor behaviour comes from Firefly's own change to the rk808 driver
in their BSP; it is not in Rockchip's develop-4.4 or develop-4.19 trees.
It reads two single GPIOs from the PMIC node, pmic,hold-gpio and
pmic,stby-gpio, drives both high at probe, and at power-off drives stby
low, then hold low, waits 200 ms and writes the shutdown bit. On this
board stby is GPIO1_D0 and hold is GPIO1_B5.

Its board files use one or both: both on the Firefly-RK3399 and the
RK818-based Firefly-RK3128 FirePrime, hold only on the ROC-RK3399-PC
family, stby only on a few others. That is where minItems 1 and maxItems 2
come from. None of those boards other than this one uses the new property
in mainline.

On the ROC-RK3399-PC, the vendor describes GPIO2_A6 as pmic,hold-gpio,
while mainline's rk3399-roc-pc.dtsi describes the same pin as the enable
GPIO of the vcc_sys fixed regulator. I have not checked whether that board
powers off correctly on mainline.

The vendor device tree marks stby as GPIO_ACTIVE_LOW, but the vendor driver
uses the legacy integer GPIO API, which ignores the flag, and drives the
line high at runtime. That matches the physical level measured here, so
this series describes the line as active high.

Why not gpio-poweroff
---------------------

gpio-poweroff drives the line active, back to inactive, then active again,
waits timeout-ms and then WARN()s on the assumption that it is itself
performing the power off, and it registers at SYS_OFF_MODE_POWER_OFF. Here
the RK808 performs the power off from its own POWER_OFF_PREPARE handler,
and the line only has to be released and left released before that.

Open questions
--------------

None of these block the series as it stands; I would change it if a
reviewer prefers otherwise.

1. Should such a line be modelled in the PMIC driver at all, rather than
   as a separate driver at POWER_OFF_PREPARE, or as a regulator enable as
   mainline does for the ROC-RK3399-PC? On this board the line was tested
   going low from power-off prepare, 200 ms before the PMIC write; I do not
   know whether a regulator description would achieve that.
2. Would two named properties for the vendor's two roles, hold and
   standby, be preferred over an array whose order sets the release order?
3. The vendor calls GPIO1_B5 pmic-hold and its backlight node has no enable
   GPIO, so mainline's backlight enable-gpios on that pin may be wrong.
   Without a schematic I have left it alone; the series does not depend on
   the answer on this board.

Testing
-------

Hardware: Firefly-RK3399 (4 GB, RK808).

Kernel: the board's Armbian 6.18.45 kernel, rebuilt from the same tag
and configuration and Armbian's current patch set, with 2/3 applied on
top. One Armbian patch that adds an RK3588-only IOMMU driver had to be
left out because its current version no longer builds on 6.18.45;
nothing on the RK3399 uses it. The resulting kernel package, modules
included, was installed in place of the original one. No out-of-tree
module was loaded during these runs, and the board's local power-off
workaround was disabled.

Device tree: the board's own device tree with the properties of 3/3 added,
power-hold-gpios for GPIO1_D0 and a 200 ms delay, and the backlight's
enable-gpios unchanged. pwm-backlight was bound and set to full
brightness, so it drove GPIO1_B5 high while the system ran.

Before each run a script checked, from /sys/kernel/debug/gpio, that
GPIO1_B5 was owned by the backlight and driven high, and that GPIO1_D0 was
claimed by the rk808 driver with the consumer name "power-hold" and driven
high when the property was present, and unclaimed when it was not:

  same kernel, power-hold-gpios absent:   restarted after 41 s
  same kernel, GPIO1_D0 described:        3 of 3 stayed off

"Stayed off" means the board did not come back on the network within
5 minutes and its fan and LEDs were seen off; this caught the control
run's restart. The serial console was not available. In addition, on
each following power-up the RK808 RTC had been reset (this board has no
RTC backup cell), which corroborates that the PMIC had lost power.

Build and schema, against a clean mainline tree (28924df2a):
drivers/mfd/rk8xx-core.o builds with W=1 and no warnings, and
dt_binding_check is clean for all seven schemas. dtbs_check for
rk3399-firefly reports no PMIC diagnostics. For each schema, a device
tree with power-hold-gpios but no system-power-controller is rejected:
using an in-tree board for rk805, rk806, rk808, rk817 and rk818, and the
schema's own example for rk801 and rk816, which have no in-tree users.
checkpatch is clean apart from an unknown-commit-id warning for the
Fixes: tag, caused by the shallow clone; the commit exists upstream.

The 200 ms is the value the vendor uses; the threshold was not
characterised.

This series was prepared with the help of LLM-based assistants (Claude
Code, cross-reviewed with OpenAI Codex): the analysis, the code and the
text were drafted with them. The measurements were taken on my board, and
I have reviewed the result.

Yaozhong Li (3):
  dt-bindings: mfd: rk8xx: add board level power hold GPIOs
  mfd: rk8xx: Release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk801.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 29 +++++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +
 drivers/mfd/rk8xx-core.c                      | 49 ++++++++++++++++++-
 include/linux/mfd/rk808.h                     |  3 ++
 10 files changed, 237 insertions(+), 2 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3

