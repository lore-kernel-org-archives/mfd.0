Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FB52D2D1
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690825; cv=none; b=RPvIRQQ+SxhJX2+95lBKGrxoMNFQF3c9RIeYI3Q9X9FzCmxiib+LnYMWuMpAd5/anijVbNjIH67ZVeRFPbL5LfmM1ikrW8L1oZugeCXZTulMY3OzZ0q9Xxc2TQEiRyhEJDFD0JEiH1JRSWP5PruURr5ymlb5r84CgJQpZxsA7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690825; c=relaxed/simple;
	bh=0GyUwrTNdmbLZ+PYd8AMsopofzqRG9PPj2WiAL/A4KI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPceQxKWaIb0Sc/qFyMjUm1xy1kJJOqhhzChqaRjyG6dVoSAL6+x07o4ndbmS92UZrNaXVX46mj4h59JOKHL/Ljg/HVHO8qd4oR1LXP1IUMzFxORkDn88sETEcS8V5Z1qWPSnosTs4OF8ENfPx2pnOX/wlVNHVe3Yq6FiAiGX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPde+5qL; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPde+5qL"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-880fcd3790bso1425182b3a.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690823; x=1791295623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSV8oGTACxJ77/sOcrKC+cMYGnFLM5ZJhrfSXvvMA2c=;
        b=QPde+5qLw7rSv9x3hTkUrNYuyKrp/+o0qef55Xa7mwvzcC9V5PCsUEUhQsNAcTbKoQ
         8Z29q/CXIoOJrOzWRnVK+CnFKqHx0UCcsM4M66w+w3X3RQdcENeO+I9VcBqhpgYW9xUK
         JZ2iG6rfSMFDl7C2aNBXYXwTdS4Ann/yww1QPUuijNfJ2pZr+5XRrscdgnoVaPJExPME
         ORd3iaXPD69UGLOeQ9iVHUa75TTUEAmGeEdxCBMaD8Os+EmflvFWj5+vdQX5lDTxVmTm
         QdvWJJ+SpVto8DHkGb6MHjbAR5y3xpQF3mDGGYnAqbONXhpSoZHIl3CL6EZvZF+O9V/U
         r2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690823; x=1791295623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSV8oGTACxJ77/sOcrKC+cMYGnFLM5ZJhrfSXvvMA2c=;
        b=QKOw+Xc2Zcn0Q3U1u4wrcjFuKJCcCxT/ovEHSdjPb42X4eBKYgOsjQmf4ph8LwY9mM
         Pt8T55Wtfupmub4gnsr3XOaTHQkDSMsaYLqMAsCC36jYXZ0btfZzmIpxqMUUB0Keb5zD
         2eS0Rwa8SGooy1SsVWiIhoBJtI7i4tFGneYfpT9wPd8qwGFocha18q/hgLByJsyew/Bb
         slACUbnpoxxgaKgauN6RBx5J5zPgUgJIXHr3e6uBJEE3kSosO84TXllPPbYifG/Mi9Ve
         FU0g+ws3Ubi0Qx7VA5wfDY4sETgYKiQJR1g8l2re9FrWiqbxbA/SL/A4cJzFsnqEC4PQ
         K/eg==
X-Forwarded-Encrypted: i=1; AKwUvBx3Y1uTu1rVZWwaLiTitsuMWTQdpbtjBTGUiaUTiEjSH6nX4pH63n1hdL/wY9mm70woLOg=@lists.linux.dev
X-Gm-Message-State: AFuF++l9mGZtqIyf3ZTsuehbLGMhNh8IdsTN1kRv6MfzesTYiUbPs41Q
	fuJG298rlLIOJkNA37Qu3DTgyjc0ROwHmm+tKncOMCazdWi9bLoo9TNn
X-Gm-Gg: AYBFou2kc7Fe7hHP0Ey7fgujy/r86eQkrUzU7NBPX189wasAV2A8Z/oPXQPGUk9ybtA
	s+iHaiWueNUutqm0gAeYa89KXUX5LI36gQuK5e8+I7PNDoKcZC5eeeq+9FLxC7GRlQdZUKtTSPv
	lrPez0BBCjt8u4m+tApkeNhz0YhSBM73gCFdAApaKpTfoxlg9wUMAgRBQkeN/xNeHc+1aYcOTfc
	e3+aWVFOIz1P7ccC6vAZxPKg0nCaVC625gdVggvPmQJQ7OdJhPtFJ7vQBGzxsmldJa1IdZiAPs1
	X9rOg0CYemzpylg9eFxJrsyOM26oqReVE+WPRAKBpvleXW7g1YmOcxs4ftfWfrVFfLkAhGT0bD7
	GCKvXuwf1bFypu4F4VY+HAZ+aPyeKrC2/Sejqe8dwE+kks3lbzuWfg5mgxRgZjP4GK/LX5nLp5E
	Vy9HeMmXqKfM4+62TFNCe/NXbJHmBi3gN2fiB3G4E+FFmIHlZZ1ySDUP+k6VPEncisTYqAihgJq
	7tzo2JD4AYW
X-Received: by 2002:a05:6a21:9198:b0:3dd:a197:cf22 with SMTP id adf61e73a8af0-3de0e8f5e7emr15327959637.70.1790690823269;
        Tue, 29 Sep 2026 07:07:03 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:02 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Tue, 29 Sep 2026 22:06:45 +0800
Message-ID: <20260929140649.55-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Still an RFC: the patched kernel has not been booted on hardware (see
Testing), and the placement and naming questions are still open.

v2: https://lore.kernel.org/all/20260919122930.1418-1-yaozhonguwl@gmail.com/
v1: https://lore.kernel.org/all/20260909092728.1859-1-yaozhonguwl@gmail.com/

Changes since v2
----------------

The main change is in 3/3, and it reverses what v2 did there.

* v2 described both GPIO1_D0 and GPIO1_B5 and dropped the backlight's
  enable-gpios, on the grounds that the backlight could otherwise keep
  GPIO1_B5 asserted. That reasoning was wrong. device_shutdown() runs
  before the power-off prepare handlers, and pwm-backlight's shutdown
  callback drives its enable GPIO low there when the backlight is on; when
  it is off, pwm-backlight has already driven the pin low. So with the
  backlight bound, GPIO1_B5 is low when the PMIC's handler runs. The v2
  failure case - GPIO1_B5 still high at that point - came from a test
  module holding the pin, which the real shutdown sequence does not do.

  v3 describes GPIO1_D0 only and leaves the backlight alone. It was tested
  with pwm-backlight bound and at full brightness, i.e. with the backlight
  driving GPIO1_B5 high while the system ran: 3 of 3 stayed off (see
  Testing).

  v2 also said pwm-backlight does not bind on this board. That was wrong
  too: my own workaround unbound it to take GPIO1_B5. Without that it binds
  normally.

Lee's review of 2/3:

* "What is i here? Can it have a better name?"
  Renamed to "line" and declared in the for statement.

* "Why wrap here? Some of the surrounding lines are clearly longer."
  The devm_gpiod_get_array_optional() call now starts on the assignment
  line; only the last argument is continued.

* "What if this doesn't return a value?" (power-hold-delay-ms)
  The property is optional and the binding documents a default of 0. rk808
  comes from devm_kzalloc(), so when the property is absent the delay stays
  0 and the shutdown request follows the release with no wait. A comment
  now says so at the call. I did not add an explicit assignment, as it
  would only repeat the zeroing. A malformed value is not reported either:
  the read fails and the delay likewise stays 0. If you would rather have
  probe fail in that case, I can do that.

* "Do we do this for all of the other structs? Why not add the include?"
  The forward declaration is gone; rk808.h includes
  <linux/gpio/consumer.h>.

Sashiko's [Low] on 1/3, not addressed in v2:

* It asked for power-hold-gpios to depend on system-power-controller. v2
  declined because the driver also accepts the deprecated
  rockchip,system-power-controller, and a plain dependency on one spelling
  would reject device trees using the other - including the binding's own
  example. v3 adds it as a dependentSchemas entry with an anyOf over both
  spellings. Checked with dtbs_check on rk3399-firefly in three variants:
  the current spelling and the deprecated one both pass, and with neither
  present the anyOf fails naming both properties.

Other:

* The binding description names both spellings, and no longer says that
  every line involved must be listed, which 3/3 no longer follows.
* The 1/3 commit message now says where the bound of two entries comes
  from (see Prior art below).
* Each patch now carries Assisted-by: LLM. v1 and v2 disclosed the
  assistance only in the cover letter.

The problem
-----------

On the Firefly-RK3399, "poweroff" drops the rails and immediately brings
them back up, so the board reboots instead of staying off. U-Boot reports
the result as a power-on reset.

Firefly's BSP drives two SoC pins low during shutdown, before writing the
RK808's shutdown bit: GPIO1_D0 and GPIO1_B5. Mainline does not describe
GPIO1_D0 at all, so nothing ever drives it.

What was established on the board is the sequence, not what happens inside
the PMIC. In the cases tested, the shutdown stuck when GPIO1_D0 went from
high to low during power-off prepare, with GPIO1_B5 low, and the shutdown
bit was written after a settle delay. It did not stick when GPIO1_D0 was
never driven, or when GPIO1_B5 was held high. With the backlight bound,
GPIO1_B5 is low at that point, as described above, so only GPIO1_D0 needs
to be described.

Prior art
---------

The vendor behaviour comes from Firefly's own change to the rk808 driver
in their BSP; it is not in Rockchip's develop-4.4 or develop-4.19 trees.
It reads two single GPIOs from the PMIC node, pmic,hold-gpio and
pmic,stby-gpio, drives both high at probe, and at power-off drives stby
low, then hold low, waits 200 ms and writes the shutdown bit. On this
board stby is GPIO1_D0 and hold is GPIO1_B5.

Its board files use one or both: both on the Firefly-RK3399 and
Firefly-RK3128 FirePrime, hold only on the ROC-RK3399-PC family, stby only
on a few others. That is where minItems 1 and maxItems 2 come from. None
of those boards other than this one uses the new property in mainline.

One of them is relevant to question 1 below. On the ROC-RK3399-PC, the
vendor describes GPIO2_A6 as pmic,hold-gpio, while mainline's
rk3399-roc-pc.dtsi describes the same pin as the enable GPIO of the vcc_sys
fixed regulator. I have not checked whether that board powers off
correctly on mainline.

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

rk3188-bqedison2qc.dts does drive a pwr_hold pin from gpio-poweroff, which
works there because pulling that line low is by itself enough to cut the
power. That is not the case here - driving a line low at runtime, with no
PMIC access at all, left this board running for the 10 s it was observed.

Open questions
--------------

1. Does this belong in the PMIC driver at all, rather than a small separate
   driver registering at POWER_OFF_PREPARE with a higher priority? Or, as
   mainline already does for the ROC-RK3399-PC, should such a line be
   described as a regulator enable instead? On this board the line was
   tested going low from power-off prepare, 200 ms before the PMIC write;
   I do not know whether a regulator description would achieve that.
2. Should the property be rockchip,power-hold-gpios? And since the vendor
   has two named roles, hold and standby, would two named properties be
   preferred over an array whose order sets the release order? This board
   only needs one line, but other boards in that family use both.
3. Should the DT also carry a pinctrl group for the pin, as the vendor does?
4. The vendor calls GPIO1_B5 pmic-hold and its backlight node has no enable
   GPIO, so mainline's backlight enable-gpios on that pin may be wrong.
   This series no longer depends on the answer. On this board the pin was
   low when the shutdown bit was written in both configurations tested:
   with pwm-backlight not bound, leaving the pin an input (the v2 runs),
   and with it bound and the backlight on (v3). Without a schematic I have
   left it alone.

Testing
-------

The patched kernel has NOT been booted: CONFIG_MFD_RK8XX is built in on the
test system and a full kernel build does not fit on it.

Build and schema, on the board against a clean mainline tree (28924df2a):
the unpatched tree was built first as a control, then the series applied
and drivers/mfd/rk8xx-core.o built with W=1 with no warnings. drivers/mfd,
drivers/regulator and drivers/rtc were rebuilt for the new include in
rk808.h with no errors or warnings. dt_binding_check is clean, and
dtbs_check reports only the pre-existing usb2phy diagnostics for this
board, which the unpatched tree reports unchanged. The built DTB carries
power-hold-gpios for GPIO1_D0 only, and the backlight's enable-gpios is
still present. checkpatch is clean apart from an unknown-commit-id warning
for the Fixes: tag, caused by the shallow clone; the commit exists
upstream.

Functional, v3 configuration: the board's own device tree with the
properties of 3/3 added - power-hold-gpios for GPIO1_D0 only and a
200 ms delay, with the backlight's enable-gpios unchanged - and an
out-of-tree module using the same gpiod array consumer name, the same
GPIOD_OUT_HIGH, the same per-descriptor gpiod_set_value_cansleep() loop
and the same msleep() as this series, registered at POWER_OFF_PREPARE
with SYS_OFF_PRIO_HIGH + 1.
pwm-backlight was bound at full brightness. Before each run, a script
checked that the backlight owned GPIO1_B5 and drove it high, that the
module owned GPIO1_D0 and drove it high, and that the GPIO1 input register
read both lines high:

  GPIO1_D0 not driven (control):            restarted after 39 s
  GPIO1_D0 only, backlight owning B5:      3 of 3 stayed off

The serial console was not available for these runs. "Stayed off" was
judged by the board not coming back on the network within 5 minutes and
the fan being seen to stop; this caught the control run's restart.
As a result the level of GPIO1_B5 at the prepare handler was not recorded
directly - the module samples it, but only to the console.

The module does not exercise the probe path, so the claim ordering in 2/3
is covered only by review and the build.

Earlier runs from v2, judged on the serial console (nothing for 150 s, no
ICMP reply, no USB gadget), each from a cold boot with both pins at their
reset state (inputs, low), still apply. The fourth line is the case v2
mistook for the backlight's behaviour: there the test module held
GPIO1_B5 high.

  both lines, as in v2:                     3 of 3 stayed off
  GPIO1_D0 only, GPIO1_B5 left low:        3 of 3 stayed off
  GPIO1_B5 only, GPIO1_D0 left low:        0 of 2 stayed off
  GPIO1_D0 released, GPIO1_B5 held high:   0 of 2 stayed off
  nothing driven (mainline today):         restarts after about 2 s

The 200 ms is the value the vendor uses; the threshold was not
characterised. The msleep() was measured at 200 to 201 ms on the console
timestamps.

This series was prepared with the help of LLM-based assistants (Claude
Code, cross-reviewed with OpenAI Codex): the analysis, the code and the
text were drafted with them. The measurements were taken on my board, and
I have reviewed the result.


Yaozhong Li (3):
  dt-bindings: mfd: rk808: add board level power hold GPIOs
  mfd: rk8xx: Release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk808.yaml          | 27 ++++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +
 drivers/mfd/rk8xx-core.c                      | 49 ++++++++++++++++++-
 include/linux/mfd/rk808.h                     |  3 ++
 4 files changed, 79 insertions(+), 2 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3

