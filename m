Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548280;
	b=K+LBhkZwfH+2NqXn/nzMu9tw+bgF7w2NFlcTd7RLXaHoLWq4GrmXzqaZpH9D6l6c9Ii+
	 u1z0YcedLgDZlY9R8vaWrZZYhI0IZI0BsF1wJzeImlwtXuliXkirf7bLV/3smVzahTP5C
	 fJboCLoyIOEXzT25QBO8UlQlqNsAGDhD6XPWpvmLwZNw0kNJ+6tnJanMyHwlscc0OJcHG
	 ug8Suzq3TWrb7ZWkx2972wqimcyb5pGKGE3G8PT2eAOsOUGyfV0Ui3j9tV57P89o3yvaV
	 DACtxfbZHuxRxcZV38EAx44n2ZcjDv9pIPfDQ6ZKGKHFBlNvmZp7RbvjtTo6scoxzJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RWrUh9tv7EDjAYdAOsOqdQW5IBSE6Zxvl6Nfwwygl1E=;
	b=pkV9yptjCKGJ+GEK/N2AaFrhy8iNnVdvfR5O4H1yGJD2QTS8ZzhbocomaGTC9GreUC3r
	 vq2sSE/htTNpch+y0B34HhB/0bs5c+OvqEzi1f86qS4JVKT2m246xM+jyo7Gq6lLhNZk6
	 VDQOUtdzXtBEqMvna+t9Z4MwOT3xMH60TO7wvJAWCQUerNt9NHqz/E/tSf4LYITSf/JUt
	 Nc587hugPzfY+XlRvLfZ6t6Dh25PWpR4M4AfkDOmUAk+VCecBT+T5tABEqZAfwkw3rQZp
	 cMajUh28O0ab+psVCHJLpmH/vr0jGYKk/EdW7gliggPjJtqbE6CZQCTPQoQw7AADfvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEw+PQHu;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE31606A324
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 15:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE31606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEw+PQHu
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1083867f8f.1
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 07:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548278; x=1794153078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWrUh9tv7EDjAYdAOsOqdQW5IBSE6Zxvl6Nfwwygl1E=;
        b=kEw+PQHu4ZjnpmxolQxFbVssVgla0XBgWssTYhrjm6tGCdRe2RePE30QgUrN8Y5IZC
         Ndt6ghGIM5NrcE4v7rk3iMpausKtC8JqcArEvRSWb1K9qGPRH5u+FSJBBEO7bB90l/ha
         fkEX2GVDilyQZM/n1g2a6SQVawjfhLhDE2/C5ruUUe1e9dS7oa2y9lADgBTwaz0iugSu
         bqwARg8yqZgji0u2wbQyLmjoBtSXtYycTa2Oa+KrKyttW4aR5RKXw93zwaMlVFPjNu2I
         AhGFVqSY0odPk/GJdxfu50LuMU4vfBN8ZgL97Vxec0COkdUrWrCtcnRO9jOHLQMcrfqI
         SRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548278; x=1794153078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWrUh9tv7EDjAYdAOsOqdQW5IBSE6Zxvl6Nfwwygl1E=;
        b=Rf+zeRB/Iq8+k1/nGPAg5CJYU71014bs7pH7YhkJbymcAPBTLlpKo0njlQmVGTAiMu
         xrCchjCekX6Jrt31QPz9g+DduyXSaASWgz6ISXNX5DtIXy3dqjpvopjeYfSg26kZnk7F
         X5hfUuiSnQdPl2l/9fI5JSUB71HwGCfSMnXQLFfp9J/yDTLQeoOCqceQQh+fFNLipBKz
         Uw4DQHbqYGEAOD6RNHWwmU7BfaVtsgFcI/Lg8L8alrF8tDDpdxiWAqxFrAnS4B25Ir5g
         pcqOGFa8bXDqClw2XnXLaKKtq4v1RjeF+MwgFgp7NvujTefx5BFUsSIvheXgd4noVBU2
         1fUA==
X-Gm-Message-State: APuU4Z996Is2fbFEPpUaX1O8LUag0lLOrMtW6mXDE5414kn52nMlxtuh
	4ovqpgFnoPApNXcrGsKzl5F9/oMimXYlTWtP16YhhRrSjesHO+3Gv6iI
X-Gm-Gg: AYBFou1VQ+OkDa6Io2mDXte4X3zMoQeTVk2MIysj0TQzYhp1/oDWtmAyEpVILMF1gLD
	hIZzmDt8kzCWHSmP3ibsBOSQMvn+jVir+bl9Iznk6OBZR+0auqqOVp0w5pw25Keig6qT6mygCwq
	Q/iYxpCsy4Xaam375yRFhEi4okCf7x+Kl5iogPMCbeok7lm+TRJB/Md/7O9pFdI1zgTETrHXCwO
	oA5MsUG+kr/6WXzg/v13W/AW6TjBq4JniOb8mHoBakR/v4/HLKJKbBaKwFK2ja2YVd3eVCDnPgm
	+CSQ2yMeRYoGQ6AnTVp2TdfN73lieVFSQ5SfjQm/hZKXRCAVwKiSwmTOymI0gwQYk7jgiOQ8VUd
	dZ9TJY3rxevAN9mxi1zM/f5w2Kgqg1USX41wymHw84vdbFrUvu/6lRox5+0wgp42ahae0XEeYh/
	LHzukBRyxTQnfnzXTORXMD5ic6EKmnQdahcDnwzPiMJl3OjpzHguUjiKspFTo8crcaALn7j7lls
	aHjaPO0s6OSFQMvOsjSmY2Pl3iOyQTCvF6eGQid3tjwi34+bC6wKdBLcusDp85rcfF1OYDUumPo
	FyuGkUdjLu6M6fJCqmYCaLzmQeoduHaieS+gRXsuIIz5/+0UtXJdllVKhY1gBFM/SeokqCP3uQV
	hN1WIvXzj8vyl
X-Received: by 2002:a05:6000:128b:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48e6e307437mr12677758f8f.16.1793548277975;
        Sun, 01 Nov 2026 07:51:17 -0800 (PST)
Received: from thinkpad ([89.38.246.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm14149632f8f.56.2026.11.01.07.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:51:17 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: mfd@lists.linux.dev
Cc: lee@kernel.org,
	sboyd@kernel.org,
	tony.xie@rock-chips.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] mfd: rk8xx-core: Don't stop RTC during RK809/RK817 probe
Date: Sun,  1 Nov 2026 19:19:50 +0330
Message-Id: <20261101154950.8673-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
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

RK809 and RK817 have an internal RTC that is managed by the rtc-rk808
driver. During probe, rk8xx-core stops the RTC by setting RTC_STOP in
RK817_RTC_CTRL_REG (via rk817_pre_init_reg), and rtc-rk808 later starts
it again in its own probe function.

This unnecessary stop/start cycle makes the RTC lose about 1.9 seconds
on every boot or reboot, as measured on an ASUS Tinker Edge R. It also
leaves the RTC stopped until the next boot if power is lost between
rk8xx_probe() and rk808_rtc_probe().

Fix this by dropping the RTC_STOP entry from rk817_pre_init_reg.

Tested on ASUS Tinker Edge R (RK3399Pro), which uses an RK809 PMIC.

Fixes: 586c1b4125b3 ("mfd: rk808: Add RK817 and RK809 support")
Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 drivers/mfd/rk8xx-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6abfda74..887b0adf332a 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -203,7 +203,6 @@ static const struct rk808_reg_data rk816_pre_init_reg[] = {
 };
 
 static const struct rk808_reg_data rk817_pre_init_reg[] = {
-	{RK817_RTC_CTRL_REG, RTC_STOP, RTC_STOP},
 	/* Codec specific registers */
 	{ RK817_CODEC_DTOP_VUCTL, MASK_ALL, 0x03 },
 	{ RK817_CODEC_DTOP_VUCTIME, MASK_ALL, 0x00 },
-- 
2.34.1

