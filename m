Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649248424E
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987660; cv=none; b=djRtFGwoNtbMuCbKpXfqqbR9wRWahYBnGaeR50PqoPzI0W4ZPWsmxkAcQoLm0pX3yjQI7l6nnTKs/cdjLrGsq4Nj5h1Gf2LsMVJRc2D/gxmSQtVGjJt7qntQWlCwTGiDv47OejOeWKdSNz+A2f+EtaBFKiswUrAyUkKvw4buV58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987660; c=relaxed/simple;
	bh=F0WXZVXUVvY/5McqBHwjv7xmcfG9Jon/vnRvlBQvq6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IG5xvRac4E+66tDNR0vP7zNM3C0S4W4VoKX1YnjlLoCzgybwMJ7IeavzdafbhFkAsxLFAryxemZvbDEgogmuOS24PDvBnH7gaEC0GrxbboXMEAoQYGQ5Lk+dxHDPdg5nywT5vONpDlq1ANczZppTYCOLo+DcMjup/BdhbI3ZVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cdh9Bfwk; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cdh9Bfwk"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a0so3067583b3a.1
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789987658; x=1790592458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJT6VrpZEKh+GTixXY0xK6q/6U7uxcfKLL31skyjQtM=;
        b=Cdh9BfwkD/F30GnJaoXQNhczlx9zsqNw73kx9JnX4EC8sPrOGDGbTmknavzWGVjXmQ
         Lhdtl49qYIUSn9FxllHHuWEyOTE9JqRNEEs+3KtcZtnEKrOd5nvDM8yYxVny2XISD2sX
         eywqvL+2Pa4RUX7yozUgxHcWTS1hNEcsZ6v29QEICD7ky5Akelmf0Yz6eVmLu+2jPHYx
         f3CAl5XXZpP13X0LHr1H3frit/Q/F2xsc88Fe/JBD6920QHbd05yoy86GWzv1mh7gjDK
         uiQcUk2XofDoBjumbX6n0OP5OOei4jkFsugBmbnKvrQpSza9lGNsiBhlAEgPNXET5RLF
         FyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987658; x=1790592458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJT6VrpZEKh+GTixXY0xK6q/6U7uxcfKLL31skyjQtM=;
        b=r4trC1M2VJRgcDrheoRfsA3YFe6XBrxOlxH8JmeNsinh5YO12dvHkZ3oPYuInFIngS
         Hal7YgmxdL7sw6HnuBiIjxSKdDYsxQNQzUf4wpfTHyvE5yqtBxJc5T4W2BFv+YMitMBk
         1l+LCNx34KbmV5Ha1CYW+FtD3zlKdw2DmyoexAqY9KwhcQl0AUZYhdMX3Xh1KiqrbcJW
         utrK4x4aQ3Fn46Hf+E7ICJydh3ODb4kszfENAmjstirRdontmN6P5ixEhw0rYzujiy2h
         3RiM85AWSXxqBpKtP1uz68xsdPDaE05ZG/ZVMa6+zctf7irCPoKHl6or8o0qxhyySTjp
         mWfQ==
X-Forwarded-Encrypted: i=1; AKwUvByhQRLYg1l+VC9iPfmyKNxTqnJAsvnPagUQdTLOpNH95th90/3dKr4F2YQzRcFdP3cYD6w=@lists.linux.dev
X-Gm-Message-State: AFuF++naqV2hIaRFP0jCen8ptVLw6Y/Nae/+8H+g+TAUazHp9szLdikZ
	7+JPGARW6xuJ+vKpKd9L0ii0Be/tQESPXt4vfvbNSe1uF+2+e24ZaePj
X-Gm-Gg: AYBFou1FcDpDqIufBluoBsemwU9Ure5PjaEdF36j2CDJ233MbBbUesoWsIPaESHAzbL
	YH3amo3Gkp9+l3Fa70Kojkiu3Po/u1zpP7x49tMkWy4qyg+obISMSV8Hj93w58IC12gEvZzGgiB
	r+1U5yLVmjWLZ2N4OnOxa1/tdQn5ZjTXmM4O8soRnccNKBSIw7kAfOX9JWYMKKfNZNZNRa6/0Hl
	LHdvdHlpTUuUvHGYa52J9ul+sbI50SY/i6NaLJYLjlqVhl9h3tat6DU5RaTwpifVCGy2wKWnmrF
	Dsk8cIMb5k/xH8UKrnqISy39c3jvA4hwLDYhlraWtfFBk4/PiM9qJANtBbl7WOyzCo5Ou7ePiPA
	C7DZ9xu5zasQOZcE2X1LXeZjD3PhCbMfRqDLcdQkW6HR/59Yruv1zr+LmIIpiFGdakYbKfk4Ih6
	TsxkEmNkVz6F+RqE4iEYusOxU4SsfP4VNY7QKCXSNZTCNFeYJi2roTmg==
X-Received: by 2002:a05:6a00:b47:b0:871:b1b0:e49f with SMTP id d2e1a72fcca58-874dc3f66dcmr15598265b3a.13.1789987658163;
        Mon, 21 Sep 2026 03:47:38 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9b0d4adsm3036409b3a.36.2026.09.21.03.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:47:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dtor@mail.ru>,
	Sundar Iyer <sundar.iyer@stericsson.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: tc3589x: fix GPIO child device leak on probe failure
Date: Mon, 21 Sep 2026 18:47:30 +0800
Message-ID: <20260921104730.354304-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tc3589x_device_init() may register the GPIO MFD child before
registering the keypad child. If the GPIO child is registered
successfully but the subsequent mfd_add_devices() call for the keypad
fails, the function returns without removing the already registered
GPIO device.

Since tc3589x_remove() is not called after a failed probe, the GPIO
platform device remains registered and is never released.

Remove the MFD children when keypad registration fails so that any
GPIO child registered by the earlier mfd_add_devices() call is properly
unregistered.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 09c730a488c3 ("input/tc3589x: add tc3589x keypad support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/tc3589x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 2d4eb771e230..309c4db99c2c 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -303,6 +303,7 @@ static int tc3589x_device_init(struct tc3589x *tc3589x)
 				      0, tc3589x->domain);
 		if (ret) {
 			dev_err(tc3589x->dev, "failed to keypad child\n");
+			mfd_remove_devices(tc3589x->dev);
 			return ret;
 		}
 		dev_info(tc3589x->dev, "added keypad block\n");
-- 
2.43.0

