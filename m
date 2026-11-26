Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674200;
	b=BuUOpgbfMkMgRdoWZygX5uIsvkMnQVOc/kBUi6PCfsrxT3tUhVQ3MDSKOXtExK/bE+fY
	 eMuyyYjhQIOHwx5e+sgA3dZ1WJnVJ2pG9rgMdP9009ZTQGcS7GokMnKRsWbXSCAGNJ03w
	 UzTwHPy55J45szTOYgoj992AyqzQyOf0btUORMVnZ/2jXg8T7pvDwLemI9/Tz1FH+vSr8
	 3nJ7xmrnmjXpnsA3v+4qNo+YdRcydsn9at+nMQiLjIhU6MgwlwG/uLI1nGaxD0WwPYWTV
	 i8687OOrDlB7EY3PJChDxRZbJPHPa0ZUlz0488ItJ4RqAp2NT2jnO5+mscu0cM5JBFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
	b=CyoeNg1QmNRn27wW5YLrKcpQ9qPg3ahM63yQxIgqmXKfhB7LnjgKlQrRKbNESmkHUyT0
	 ifaLxRMFcqz2YomJOPM6FP0bsq8UTAIt25scL3JX/o5qmESJ82mN7McAsoD6pifVBsqWV
	 YAU0Ytq57lwFqMuF0SB3VGa8O+f6AcxZi16jnitk2a+sEj3OLzm1XwT5LVjJP+3uz62xC
	 VfPSvSVu84bao7lmM+y5YTGEmByTJsdHaxy3HmwyUcvFD7khQMTMX+Yixb8NtNrA9C475
	 3fXBx36Qc8KApxNbuu3S3SQr5y2BvYOh+kx+VnmTfAeVPc+0usSL/I139UeVTYmVr7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WbtGri8j;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CA5606A329
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 06:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CA5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WbtGri8j
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f037bc348dso54074235ad.0
        for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 22:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674198; x=1796278998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
        b=WbtGri8jzH6OhF5BOh/8QIJcudKiHFJiYRd6hM0T8NKNUQElJ57BRr1Fi0R5rodXUJ
         /IfMtsqZEut0G1CtX/OapinrU+EBn7UggGgJE1+F7QgE+EhTZ9/hvES4dFRgNLucL00M
         Quu6lxUDzeXqZwbj4SGfQm7d5r0+AiEUUHi4pn8Hgk8Bjl2A6NMOvstRfLbMg2PUiDfz
         1YpzL3XclwTmV734bSnKMEoe7+IjfMIwMV1XNj5k4JB09hW1xh/QcNXV4W6AejuGgcJp
         YeqXv5Q00lOPJpUpWUa8MqgQHL0aaAoDowhln3o24CgGDCAtD2Vt85RuF6CGQzU8PUcK
         cUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674198; x=1796278998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
        b=Pw4RYAXRiZhdlSc6lhGyfYel5nzAMiV6FcIjqvorwhGcrAG1oR0BxN/ZzqsZPfDGat
         DohtfLrcTpXYFm7lDlDuodeR6Q8fLGRv1/pXE6uK1uQSFC3BFPIbE94/vJNt4oTaS4N+
         GFjlGpAUSofRupGEvhO9mBE4WN6hz08GjijfTLSS8B1FZK6LWWIbwCd/QdJrMqDhaq47
         YWmJ+Q2T6IAgN/fChWoiAsKq6+cgnnd+YeEBtUHNa5ANyAGVWFYghvQzqJJho64mbyiD
         3TsjoTjzqJo3l0CFg4n/KYCu1+Gw+O401ayKl18XbiWAyyMwaR+Y6yWnR54XJ9DtiWxm
         XaJA==
X-Forwarded-Encrypted: i=1; AL+hErFI6exNBzyfISQl5EatVHfwrLoNgyfu/h+FxkFKDkJoBhD2vlm1Kz+uVV2BvoleXF8V1U4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Wd+BxvyB/BPOis3CywBxOSsGk8fsb0YDOR/hCBUPKBWLbvpDO
	47hYIu4pf9uNrTAwq0KoiKYfQYWCrus+94e+cjYFfW/3gfvst+UPVQgP
X-Gm-Gg: AZFdTZfk8HHig/eToyUPObRN7/ssKWozprAMaGFUAY5xo+OV1dRIgzdGGm/B8TegGMU
	dtl/5rNFeK5F5jQa+vifwHJOowMkH/lfOIcPqktX1mjN1PjADmx9Nmrl+OaOmSq/LjhBBHYrtha
	hs5ffQ5/MRDJ3QKSoOGXgMvdsVfbmFdYyLqisrfmgk5S0Mps0ha7hr4AWHe2HsvJKXvTKgL4nHs
	CDjl8zFEyD40LVl577r9avUx2DCJV1j9ODh6UiQz3HByPTseGF2UtE3D/A+LQqlUJ+Vw6hPqXlU
	HM0rz3iw4WVQVbVtgz//8y8hYljhMTri5NgFc1xhWB0BwewsFGk/6jQpkDVT7rmZ1mSsEP/T628
	qs/+5FZ5gJw1kwJW0TwCK+1RwdZUPSfhmEvEUxqgOd231E9adFvLVly5gvXN8zIcSxRsR+fStMw
	9jnbNuxSY27z/Mt84UgqU9sq392PnEVP3iKDImFjqV4hCRcgn0Pff+xusUSIhU0S7BCTYLAulul
	HSAdM2pdoEPIqt2wgNGB21l0d6B27DQZ00/1cuWpZ9u7yjU8yyNTbvlMwLq6vump0TA1udlP5Y2
	E6wqz2jrMz1Fwc3VlYFqIZX/+ZNx0byeIr7/0kgdRtUHWmUeRqpMMG/UMA3CgnDi/wAX
X-Received: by 2002:a17:90b:2f07:b0:3b5:a68:297c with SMTP id 98e67ed59e1d1-3b50a689b5cmr2618272a91.66.1795674198424;
        Wed, 25 Nov 2026 22:23:18 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm18122486a91.0.2026.11.25.22.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:23:18 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	mfd@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>
Subject: [PATCH] mfd: rz-mtu3: Fix MTU5 timer start register offset
Date: Thu, 26 Nov 2026 13:23:07 +0700
Message-Id: <20261126062307.53943-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

rz_mtu3_get_tstr_offset() returns RZ_MTU3_TSTR for MTU5, which is the
index of TSTR in rz_mtu3_8bit_ch_reg_offs[], not a register offset.
rz_mtu3_start_stop_ch() and rz_mtu3_is_enabled() pass the result to the
shared register helpers, which add it to the MMIO base directly. For
MTU5 they therefore access offset 0x002, which is TMDR1 of MTU3, instead
of TSTR at offset 0xab4.

Reproduced on RZ/G2L SMARC with MTU3 in PWM mode 1 on MTIOC3A and a
temporary debugfs hook calling rz_mtu3_enable()/rz_mtu3_disable() on
MTU5:

                          TMDR1 (MTU3)   TSTR (MTU5)
  initial                     0x02           0x00
  MTU5 start, before fix      0x06           0x00
  MTU5 start, after fix       0x02           0x04

Before the fix, starting MTU5 switches MTU3 out of PWM mode 1 while
MTU5 itself never starts, and rz_mtu3_is_enabled() still reports MTU5
as running.

Look up the real offset in rz_mtu3_8bit_ch_reg_offs[].

No in-tree user starts or stops MTU5 today.

Fixes: 654c293e1687 ("mfd: Add Renesas RZ/G2L MTU3a core driver")
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/mfd/rz-mtu3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 7e1313a57abc..b7872ee0ba97 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -196,7 +196,7 @@ static u16 rz_mtu3_get_tstr_offset(struct rz_mtu3_channel *ch)
 		offset = RZ_MTU3_TSTRA;
 		break;
 	case RZ_MTU3_CHAN_5:
-		offset = RZ_MTU3_TSTR;
+		offset = rz_mtu3_8bit_ch_reg_offs[RZ_MTU3_CHAN_5][RZ_MTU3_TSTR];
 		break;
 	case RZ_MTU3_CHAN_6:
 	case RZ_MTU3_CHAN_7:

base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
-- 
2.25.1

