Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432749;
	b=DgXlQzZ3LOAxN3oVx/lPihEHWxjDO/DlHd4YwBM2uA6oNr9GFIqP/9UW0kGI8HhAvQtT
	 PXZLK4M/V7H5LEmDoDPd5RFJq//oXvhPW/3nuKbjoaqAm2A6jpOJSdYjPJ5M4CZc57Mbj
	 z3SxB3AV4SXFA0GajbBoAwnDS2rmF8r/bGciGCQad5bAHvJ0PzDOiSUa9rctGdoLJkFKd
	 pypF9T+0KHyOz4PDCSV1r4eVnn0e3UlTsta3pcBSHWsRDcyBVbZKXzyApMqFAzyMh0cdR
	 jgwXhIcrgmcsRd9Zmr4vuBL8FgRiDCZS2lngy3rCXIEfgXZJXRZpVqtqqXk88FslHjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4w5MOz7oNXtfVQcCh063w8YKKnIPAYFn/6zOsg4K2Eo=;
	b=i3xC5kSVmSAdVGb3yEMO39BmwlliuC1J2BUcCSTBfjnue1SE+ExKRB9xA85pkEHDcAo9
	 p4vJ0nn0Bcrn2/kLfBtK/F6zomqEGl8wzoYfgFzkdHsruvLwWEoRTRdyAOSwPHpHqNVMc
	 q9Jcnaa7D/4qqCXosHLazuvUEa7BIyZ31650awprZX9DO1ObqvQdSCzR9lAfhnOvD7RZq
	 Ya/8uIk/tH4aDI7u0fmC6uBCVNYF0UWq6qBi8DUGKCixi1DF5HjVyMoQiBERMCNGpYi+o
	 IsbT4IzOlnOj267I70UOkY+F8z+TrXTHYU/zP2k/hdEWbdptr3+xndloPRh0I5M/C4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ETaLxMH2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0582D606A6A3
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0582D606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ETaLxMH2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so27255375e9.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432747; x=1796037547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4w5MOz7oNXtfVQcCh063w8YKKnIPAYFn/6zOsg4K2Eo=;
        b=ETaLxMH2NtP28NFYlcleGYtYYL86ZDBGmvwETmjRg0f4qA3K0zW9p/7LXnoxivCyO/
         u5SjNRwBQksjlILg4nEYs0WzZFldXUfWWpZbisvbRozQieg6szr4PRlzW8Q96j1iJbaT
         hYK43LifK9a/8wk6Gtr2pUFhnzf8SPhFZhXJExhDCTjjBh6qRJr1dHhn/wruWmZO6669
         iihMQ9erCshiI/siTBKEtb1CuznfRHbc365vOLFoxp3qyHX5poHBFkzvs2M8Qv4udFDX
         G+9ksSWo2rEpgWx1Mc9Nbc1HZne7W2dMoglVoj4M9C9eYXl+Z9JvWCBPCXOKVnhLOKTV
         Xf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432747; x=1796037547;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4w5MOz7oNXtfVQcCh063w8YKKnIPAYFn/6zOsg4K2Eo=;
        b=nwu1F0fnQRRmKTVTAUhssBKJz3E3oMvdqydDRU9n7JJUxPqfwGceFvkzxQq3Yg7vxJ
         L5CESvsBswS6NwyQpGlYgKISDuXcqN08r3HJ+Y5G4zf27X3gIX7GwgUi9wARcX1pIgzJ
         4b8ZHOAMCsR87/YHpgBSkbc8QgcsptUeHWacnVPlyAd9GF0awR0DM/3W6PmWcy8Af/Fd
         iuGGoWediiLnf5F6vfsl/qE5+T3QBiKcTL0vlUuhTlIuG+rTfKA/ysEqu6A1iGvCfYdc
         FtvkhFu3IuAGqaRD1zqQqjS2GivQTdOW+Y5Sz920S7G7WpAXJSgOqO2nFNm+X97+V2mC
         RI3w==
X-Forwarded-Encrypted: i=1; AL+hErFGiHcBPk6pxOzidrtkX7ViII3d1wEkEQrdjgjESQoSRL7anWxd/lhse5o7uHT1eYH+pVA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9dQjP/JBOhp9voFdxJf9rbA/QtIEHeS1201nARbFf3j7OKqOm+
	hWXPIJTqfIVqj4S3c8jaVVUn6uoii8QVVxl3dkYOwP1PvvpMC9AOPYegPkaLaa42lWI=
X-Gm-Gg: AZFdTZc7HIzn5MwIhzKxqM3NUa7BlTFSJcD/HyZsXScydV0mw2SL0xxvuEV+9NOMRhW
	GHSN3sSTeNEf2IKlHvlHjxbQ1CZZeF6eS3Xiu43nWtisQ0OUa5yiluJs5eb5zZroxC+BKqT4vbK
	avabzml76RqVJ3WPs/NoXe4GtiR5uRMN6ZMtkZMTSKbG3MTmLAobvAPqUguOlz2PistMUTTPWyl
	dVmYscvZlq6V9a2QK6ommLr+IptMAFQ+idoawZWvZ6NtCzs94mVyIbh3fAdhWMTMYtieEawNOlw
	+x3k/KIA2Z73Jnh2MVim52c45KgSsQy8muxZlCn0Qo1bdIapVGt6y0WWCdXRD0czzz8g4cqPmzf
	+PqnafRtTBHP3eWu7aHwFqbHMzEMIpqi6mcx0wAgTLpUnXVPfjDOVidjoN9SryXTETi+ORcGwUW
	Lnxf1Lvx3RcGchFAFBCw6P2Rkbs2GYFQk17eRXrWHlDbAkPyEe5I78ZEq6I5tGassNOQjhTJiXi
	EAB2u7IBm6RRWETCvn4GaFXpZEaajh6wWuNIPILP86G8ssrBepSaQN+t9BLjJG+HnnHNMiPcs8u
	SzXefWbyVhDDlzjYgk8dVajx91FWpVrZOvHLeRL8DwkZz//Uw7r5oZ8i3lSCLcs+pLel0BqdNAE
	DDEk2E8bGhkBcXvQ2
X-Received: by 2002:a05:600d:600b:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb88815f1fmr231222325e9.21.1795432747376;
        Mon, 23 Nov 2026 03:19:07 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884ab091sm492561025e9.11.2026.11.23.03.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 06/17] mfd: rt4831: Drop irrelevant __maybe_unused
Date: Mon, 23 Nov 2026 12:18:04 +0100
Message-ID:  <5a156b0c78839229d6f2fde9969ef2b6ae040aeb.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=V6UpMGGkY65S72eHMVKfqXWtihYJHkQFIRAgF9lSblQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCD28rAKbUoU3xUCNhlqejCEq86VpmIyYg9b5 PQU1DjCUmGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg9gAKCRCPgPtYfRL+ TqhUB/0Y3ELc6KYLLcliz0oqjV4eTP/MlesSRrfOac9hm7mNe+BVwF0nktuuAVv1k+lAoNPFkCm XpJPv7qd4q5GcnTXzSm1xHf2vRUOL8Hcga1PDf70Bs1gh4GXTQgHgQgbaMEdAvkottEl1/8d8T/ Vra0xAHtHvaFSrMkljcY/5QL4A7InJ+sHgNCnxX60LZDhcCasmV/FES7yZ1FPIVoSifb8Bo45Wi qrPXVzWWGP/WXzAR9rA6cvsDKlCP+wyQ80rMk66sSQ7OQuJwKRot/WAOfSmsxO8slF+H0lyIaqU AF18gd6bLfzm2XcUzxtH98zZaTi7Eq14tL/yJIuyaGxGSo/U
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So rt4831_of_match[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/rt4831.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
index 1ab8870e4ebf..2b3f84b81c65 100644
--- a/drivers/mfd/rt4831.c
+++ b/drivers/mfd/rt4831.c
@@ -98,7 +98,7 @@ static void rt4831_remove(struct i2c_client *client)
 		dev_warn(&client->dev, "Failed to disable outputs (%pe)\n", ERR_PTR(ret));
 }
 
-static const struct of_device_id __maybe_unused rt4831_of_match[] = {
+static const struct of_device_id rt4831_of_match[] = {
 	{ .compatible = "richtek,rt4831", },
 	{}
 };
-- 
2.47.3

