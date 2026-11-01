Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547669;
	b=aMIyK/jLEDq6tj/s1REGQ4zUFRYil4DlNmzZiW3fGxWF37S1+SK8bvOMbenDGMNALWfk
	 NpI2tKt0zL+nIxPX6QtX1L7yOclw2otmWVSQmwBI+PdWkkjSRfPB7g+qHoXiY3Vt05mR7
	 qntiAf6nnCUYzpiT3RRvm1P77DouFG3XYEHnEmGXkj6nCJBJXP3m2E1/tSVFruOVk8ywu
	 +2qYREUnly1etnONPCklBMCkn43VqKUWaWvQRMot7xq0hY/vyDQwZKjfy/0ghCGCU7oBP
	 zwG7Ap9fgNfB55915lhMpMVfTnhTuc4ZPihat5LW+K8NoOuJ0JUjWHVemZ5bdeAuDOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VfVSg6J9YTK+S1KHXi9vFnCAZ9+tB0XOm17kW1wwFZc=;
	b=NRaDP3oAEnrdHzS2an8DMcAqPUcLcVzULZxY3X9eT6dtrrPdNCKQBc7GxjHfwq1IsATx
	 mT22B+3fxbZxBmqeummZOz78L2cRDmmyw2XE938IhGsjYqStYLY02qOO2Win9F4dXE+93
	 hEhAvG7TKquwEnudxZ/eJYQ3brY4vJbfCmLGYB/D9fep/Ny+ySUvTXMo0GzKvgOC58Oa9
	 pqA76EhkNQ4NP/toLKoqLP0MGUezGJG0TV8A203gDtpElD2ZZoqpQnc3fcmPCTr0vIwdE
	 rn+42GBzwf1FD2y8lRqqMRc2exUJvU5mKvLhXQt8lLD4TfanI3UbQt6twhrYQFWolvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nJcd5A+k;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84DF606A326
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 15:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84DF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nJcd5A+k
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2851310a91.2
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 07:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547668; x=1794152468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfVSg6J9YTK+S1KHXi9vFnCAZ9+tB0XOm17kW1wwFZc=;
        b=nJcd5A+k/hO//oTR8CUMO8U2ImU34Yn4SQ/j3WzEEJIOTbu6LPQe6OJ5RvNv2zfxVy
         EWjxkQ+v1gGrGE6MkKhponBbb58px0bo/KgnZW7hAdoBySPsyIVjVj4upwQ0R9I8hrg/
         g/BIlNILVUVXiCOV4L3gkD8jNtz7hcPRBhq6f8OcAxHh36qOAzqb1jQXFiLvumiNS+L8
         SFrkzdV8VXuDuacrPWCjj+380o8CyLfbAfGUCBZRQyiCOpUX7xbuN1Blwkynqz4vHoKo
         eNd17avfm9BlCFvBNPGOIlWAmgPV7NW2PwJU7r7VVZUmz78ZjIhOCNCNZq6y4mhlKc+J
         Mhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547668; x=1794152468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfVSg6J9YTK+S1KHXi9vFnCAZ9+tB0XOm17kW1wwFZc=;
        b=acKV5lpdvlYMHjmpnsvYcbTxe6qraiPW32rJc+X6M5nuSHoOknBKhwOg95okQTwVnK
         xHYsKVeTVbppBMn6+rkEm10RLRZwxaJCbLupfJDmG4aX3vlO2FxUCD9fX8/iZjK6sByo
         9RCHKUvhLVKTLrbqpCnZPtnhAE8ZtH40ifER0I1hnmRaGUi5Kxn9CIKD37en0wSlQwST
         gDuPp2XybOXjn5JVlNh83YhLMTPhxVcJjGpf+TT5wzKbM+GQjYC82VPSLWs8/fLVRCAj
         SJP8DCtNvWnZLPZXJYXafgT+4F8V3XYvm+s5sC4dagpGEzge73pQMrsknjSW8Pg1erR7
         eikw==
X-Forwarded-Encrypted: i=1; AKwUvBz8Rlsk1XOXJ335qhu9udKy5nL3gYgptRYACiTJyV+uFqZuDVe9qglxBWBUke38zx/MJrI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9voWszaoIUhlaYZ/d5QvQQfg1vb7uwZ0qKw51jttpX/iwsqHHl
	Sd0nSNJClT+mHO3/jsKdpsV/Y80gdRmO6Li6tGXMLj/Ra5AEXnUwHdq5
X-Gm-Gg: AYBFou25lqfKbzAKDkG4KxkRyXP5ue4pWFVrSvpo60BvLpzGzn5+T9XV2EcPIhGLvfU
	yprLw1lvP7HyS0q/TK0Wtcn1qgGQMxKiCmv+KovdIwUc8PEwNCSFGcEFmPYTeRz2t+FhLDq381o
	PXhfd9K3MpucIJt00L+4gBnRbbmBw6gayOspGOWAaPFw5NEhc3RJYa8OucErVs/YtVsZVGdvhzB
	datPIQsXEtnFGSFfaYum+qf7hvyn56Rp4N65gcmUqBLqnP/r4MDLKeOvjzVi012lgoz18SP7FoR
	dBdjYQav8pkdsNu6iYVM+PFBURsw+x3ITOrnUi65aGVjf+DxCxDt6bxKLN6Ygiii8P+xpr8hoVg
	amXeWfPYYt3N4U/4j9z4+NqHpXO++GLBSL8OYgcm/ULuakJPcxPvAIFjRZNERWrSvfrwddjbtEt
	w93NB3YFVMfr82/rEqfXMqqbKLywISFC4qBw3HbAoX8WHQnGaC+WGj6n0b5+40/tuiBlM55O2lD
	vNlDBCXwErFJ6wh5zLDf0a6SJc4Ev3LK1MInI1A3RD1cVNUQnk1toZl+3NrFuu/7lPOGbBsLah/
	ckE9c8tbVHo4YJ8XiOzdvp5AtTH63I2n5HUp905RwJzhCpu6U4RjwRi0n2kXoqo=
X-Received: by 2002:a17:90b:2e52:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3ae897ec759mr6328319a91.25.1793547668113;
        Sun, 01 Nov 2026 07:41:08 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:07 -0800 (PST)
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
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Sun,  1 Nov 2026 23:40:49 +0800
Message-ID: <20261101154053.3874-1-yaozhonguwl@gmail.com>
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

v5: https://lore.kernel.org/all/20261027084511.1992-1-yaozhonguwl@gmail.com/
v4: https://lore.kernel.org/all/20261020140127.720-1-yaozhonguwl@gmail.com/
v3: https://lore.kernel.org/all/20260929140649.55-1-yaozhonguwl@gmail.com/
v2: https://lore.kernel.org/all/20260919122930.1418-1-yaozhonguwl@gmail.com/
v1: https://lore.kernel.org/all/20260909092728.1859-1-yaozhonguwl@gmail.com/

Changes since v5
----------------

* 1/3 no longer repeats the two properties in all seven RK8xx schemas
  (Lee). They are defined once, in a new rockchip,rk8xx-power-hold.yaml
  that also carries the dependentRequired rules, and each RK8xx schema
  references it. rk801, rk805, rk808, rk816 and rk818 switch to
  unevaluatedProperties: false so that the shared properties are
  allowed; rk806 already used it. rk817 keeps additionalProperties:
  false and lists the two properties, because it also references
  dai-common and only allows a subset of that. The property text and
  the rules are the same as in v5.

2/3 and 3/3 are unchanged.

Sashiko repeated its v4 question on v5 1/3, whether the lines should be
board-level nodes rather than PMIC properties; see open question 1.

Changes since v4
----------------

* 1/3, following Rob's review: the description is a folded block with
  the two paragraphs separated by a blank line, the dependencies use
  dependentRequired, and power-hold-gpios now requires the generic
  system-power-controller property in all seven schemas. A board that
  adds the lines is expected to switch from the deprecated
  rockchip,system-power-controller at the same time; the Firefly-RK3399
  already uses the generic spelling, so 3/3 is unchanged.

The driver still honours either spelling, as before this series.

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
  rk816 do not. The subject prefix is now "rk8xx". (v5 accepts only the
  generic spelling, see above.)

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

These are still open; I would change the series if a reviewer prefers
otherwise.

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

The hardware runs below were done with v4. v5 and v6 only change the
binding schemas, so the driver and the device tree tested are the same.

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
dt_binding_check is clean for all seven schemas and the shared one.
dtbs_check for rk3399-firefly reports no PMIC diagnostics. For each
schema, a device tree with power-hold-gpios but no
system-power-controller is rejected: using an in-tree board for rk805,
rk806, rk808, rk817 and rk818, and the schema's own example for rk801
and rk816, which have no in-tree users. For rk805, rk808, rk817 and
rk818, which still accept the deprecated spelling, power-hold-gpios
together with rockchip,system-power-controller is rejected too, and the
same board with system-power-controller passes. checkpatch reports two
warnings: on 1/3, whether MAINTAINERS needs updating for the new file,
which the MFD entry already covers through
Documentation/devicetree/bindings/mfd/; and on 3/3, an unknown commit
id in the Fixes: tag, caused by the shallow clone; the commit exists
upstream.

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

 .../bindings/mfd/rockchip,rk801.yaml          |  5 +-
 .../bindings/mfd/rockchip,rk805.yaml          |  3 +-
 .../bindings/mfd/rockchip,rk806.yaml          |  1 +
 .../bindings/mfd/rockchip,rk808.yaml          |  5 +-
 .../bindings/mfd/rockchip,rk816.yaml          |  5 +-
 .../bindings/mfd/rockchip,rk817.yaml          |  4 ++
 .../bindings/mfd/rockchip,rk818.yaml          |  5 +-
 .../mfd/rockchip,rk8xx-power-hold.yaml        | 42 ++++++++++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +
 drivers/mfd/rk8xx-core.c                      | 49 ++++++++++++++++++-
 include/linux/mfd/rk808.h                     |  3 ++
 11 files changed, 117 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3

