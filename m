Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5104963D4
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575856; cv=none; b=lvo5YGNM59Tum1sfFdCq4vdvy2rDMWOimIbzj1XiGtqE8cuWysNh1Okjso5GNZsbpLT+Xs1OgV0iK3ChDl2ZSZT7gTvPIC5CgDayPXvz28KhrKFDXyqqif/RWM/JzpyRrSPhpf54DIzi9WSbW+1xDdjs3urQ8EoMDLQPwAUHq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575856; c=relaxed/simple;
	bh=ngHy1BRmwRuVWcjURHW3vBTNNYcsBndiD1VA3Og2SHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhYbG53xInrvffAlKySwO/bn9Z8ft8kPGPNqsWOaolMLEBTGmifwA9FJ4EE8J5w4YufxgOuvVB0JcVfJ2FWJpeyoclA8v+PmKPdWxnvQnysSH1C0c61pTXzBoqibde/6beIP7Fow9Enm0dk6umGlfeseOshl5/R5A/j6mUSre+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZ+4iI9d; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ+4iI9d"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so10083341fa.0
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575844; x=1790180644; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzAx82TXon+rjcyUNQDTJprZM/vboyxwuHGWfLQKQbo=;
        b=SZ+4iI9d8lEPtIFDctqidCvqQVP9mEuKzorHNXePpi4M7eKN5Ig4u2EUdfcswhU9FX
         mTMwVLCKKvF4GLl4SGXc14+xP3YbxCxJK3ocG3OxzCB7e4yCVX+wXODJ3T6gfHBhc7T9
         ylJG5AU2nSmVBjM7ifG3EgWWUE6z2WWW+NXJi0KrG9ym49zGgJrZWA+xM/wxBVEsPVVe
         IwwlMa7nOGz2p8YtXDHQLUgAvrSklWiOH/AM6Ut6SShjHsliqt82nLUhG1Uun5DVMUhu
         D+aoqmn0E1MJv9TQnJo3id9mRdVAqEBEshFVPWJWXZVcrIzrQvQuaNUgv5IegxqUXzeb
         MrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575844; x=1790180644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzAx82TXon+rjcyUNQDTJprZM/vboyxwuHGWfLQKQbo=;
        b=dSlq2J8+bIECmYpewEbFLwGAWpHkGwEfFUTEs8+nrhpJxU5uqcXi560cZGu+dIcRG0
         EB7YRlnfCDuYJ4Em226sOOEwrWFdniMr1g89rwkYkBrALn4xZDA4c5/pMn++pSLHN4Hq
         /7ACLCrWAiY+Safayxav1LUW7jrnhvfTgRboHqccnivBRbmxnGuO3iU09/eDADEDGiYf
         38Ogc6lqzbAwVApGyIlsYvVEA9Gczi4F4gWzxiaUPiWTWwPQYDg3azT24hUGnc2TaudM
         WV8OpJrZJP4Lk9fO8fpNC5ebEQevbwpB7QmDGLAWgMPoUIr0dfBUlSka86jFCkbbMUDL
         sRpA==
X-Gm-Message-State: AFuF++kAlJ9/i641ipZy7Hx6gi35Pb0IPnV0CCj0ksbf03Lz/FsjTmtl
	0yRElPuu5oIs1248BzHNbUClg9/DUyWfaC2jK5KCfcGLori9t652UIEbFUXUOp/GXQ==
X-Gm-Gg: AYBFou0voPePaaswBMSM3undtSLAXRn5kK5EzLr9aJ66ZGYOZgsqw9kz8Am+f9lwoj5
	4WiRCu/TvH28nXyUukb9nQQYFbdYbKwUWJydjG4789VaxDtbfNzcdv8f03X+3wlJXxtdd2/5icj
	Er1pEKuXm+y5Wac1ZzJ8VVEHDViUBshLbI9eeogxJ5BdQWGmL3WXjGv4WQ01apkeDa3kCUIwqz5
	NQYmMPXMPWdOGMvG6Ma1pAz1dqyOCX5JN1DD0SU3VdSa6Fq3A/o7YzhF7xp2l+doS8z7OmVXFTv
	Tp96O8Jt4M4EtoO5n5NMmxW5xPebxm+uiYm5EZjZussi2Xhw+PQBnAO+4slY7olxJKI6kvNO5up
	CZGSTnHiVGA5OMjfbZ0fndvPJtqYet7LSQZqmosdEd00vEYy2r7BYJjTICPGhl8vHLZ0ll5RGR/
	NCz8lnTlKiWApotV+1k61Z2lNnR94WIbtESC9uf2Vc1ev4gNpPb5NQCIz0M3cVijLrcVkNpe1Xd
	JwFVZ+FXHEGoRMYIwz5hHnf
X-Received: by 2002:a05:6512:2246:b0:5b2:a558:b222 with SMTP id 2adb3069b0e04-5b8b6615f0fmr1898403e87.10.1789575844328;
        Wed, 16 Sep 2026 09:24:04 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc66fsm1036205e87.37.2026.09.16.09.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:24:03 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 21:23:50 +0500
Subject: [PATCH v7 4/4] mfd: intel-lpss: Switch to debugfs_remove()
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v7-4-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=ngHy1BRmwRuVWcjURHW3vBTNNYcsBndiD1VA3Og2SHM=;
 b=kA0DAAoBE+t+6pmjn6IByyZiAGqqwpijb0mm7Z7Aa077tn0XyyBD0ZIUfG0CBN9avF4tnmKJr
 YkCMwQAAQoAHRYhBDwdkoo52qDkNGIzSxPrfuqZo5+iBQJqqsKYAAoJEBPrfuqZo5+iEmIQAJdE
 imQtboGbbGZFwvZXG4zc+1xYG9mNj+soYy1M5Z6tfMDrFgewk4EyhePERC+dtOsex43rufmawUQ
 42H6YPVjyiHizeUR5b1m3iolu9nl2g6b2YCQ/VVLX/+j0JafQMrKrtG3SAun4wkjjytQS6QT/nJ
 xPcNye9km7pwiN04ISH6iL5xbo5iKH0Q3j9nveAwDF/+8o4urlOGE5hiqganq4vdVa/Q5w14Gpq
 QQLVMC+0ZCNiyKgfaGS6V/Id847JZW5Y7GHri4zmkBclJKUsiW4aamR3YBcDTHJnXTayd+EYhMz
 fGxXBAyGauem6YArXfQCtLIcrtohbMivG//yJFLqfQ0uKhWtafgFjVOIKzU3p9+TF2a4bmhfydq
 ubGOQ/MGKRPEsZzAX3TzjuE7dzSpaIKVdhpqS8DSrw/KfpuMDwJoOfQC7cnyWtfKTbWrnAEC6q3
 FojX4pHf2fbl3pRPiekMfOIeD7PYSo0lAbOyIlOpcfmlnLTEVgIzvB8HIdwkL8ibQPmlBaK1ki9
 OLgFp8gckg6hHlEkxOgNBTLGhImW78S0n3ktvzi25mZn8AtFnz27fg3Ufi2xy1gccz8WFS+yq0j
 4IURBj5mXxtu0As9EErT8A6kd55aCELvFuwnCW9TdboV/2Xgr0sktFTjEx9/b2BEydF/RebaCzw
 Gss9N
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

debugfs_remove_recursive() is deprecated and has become
an alias to debugfs_remove(), replace it with the direct
debugfs_remove() call instead.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 170cc004a9449cb352e3e1ef22ceb35759368ff4..29f30ef0da9902a9353eb9c12f6121b4a7ed8c6e 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -156,7 +156,7 @@ static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
 {
-	debugfs_remove_recursive(lpss->debugfs);
+	debugfs_remove(lpss->debugfs);
 }
 
 static void intel_lpss_ltr_set(struct device *dev, s32 val)

-- 
2.47.3

