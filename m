Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C33143636F
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616415; cv=none; b=jZ0ggOXfSpDyGb2tgOlkDX4HzqgHx0fc8VDuepBoND+sNOR2JPkL0ASJInR1PlKJqa0gAZH9jZ+vz86pTiF5HZXFOI1SwvFVO38Ze/g9a6yIh5bfEVglJ9bAomIzs9DP8KMESfowGhxzydXSv1MOj9PACIAlNGI1TQevqBbPjlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616415; c=relaxed/simple;
	bh=y7f83ZY+gmTL8dJXkT7Oh4B6CFbmyiwfPpSWpfyjPp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HOhqVU071CIe1lBAm2MCi2Kk96Pi8OFqD/AMjP624JOmVawMNCu161coBv2W9QIkYQjzZgKV8MBMjrjrExItWXrXIBYm2CGrq9inK3nPtMzv/Gm4Gd9JwfgyoX1vkklesknYPCuVwVnbwQZhzC4o1S/b7iruJt8rSlW0bAdbDB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=G83TvB8E; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="G83TvB8E"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47df440fcd5so51840f8f.3
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616413; x=1784221213; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GlJi+FC4zIqo5knAgHx8QAYTJa9mVgt2EW47vWH9pJc=;
        b=G83TvB8E5mIPvwdhVKOxngPC/Bpa5Ee0iQ/jLbKt59B14u2BzbVG6N/HuB1NQOc57T
         wp+dN3gbQFdq/ZLhXmDpn6D7kltPlS9R/g3ITHrhXjq8eJLWJ28cCXyrkM7tl8+LuCPK
         hEkuSwlOqcVsPjhIAQk+OvtAoxgLiUidzGQwcbG2z8IbmGcXCb22l0W0vbjXDQUo+bnZ
         mXb9oGhDRVre7Pv46wMU9QCZzbTkThOTK7RZezKxFBtWwUGIn/aAQx/NFuylzn6YY39R
         YbguSB04gr7C6A4+1uH5ZXw+vmsm+M2kQypG7ayHRy2SEIMM1xB/oeCeUuw97lqrZG2Y
         rlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616413; x=1784221213;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GlJi+FC4zIqo5knAgHx8QAYTJa9mVgt2EW47vWH9pJc=;
        b=Tbvso+xz9GAZZer449xQX1W/xI8ma9Hsg+gCQVlZYgbOdHERrC43M4gBewHB3wHlBq
         vwQAO4ivxLHm2SwuEIOEQIQv+JPIYYbq9T7WoYQn40/WluoPuv9YH5cBcZTOh7lOksKq
         ifDspNP8Mi/wdJbXi5BJamzmReuYAsPWuGBTgaa2OAIi99f393lTygjF2ygCkeSDt0Ey
         5t4EJzRsVthpBRFUFDqRqb+sFihabQOZqp1XMICdyrlqsFfL6rccoRWxr9L+M/sTFHU9
         UyUJZeVI7xuEa6Wkgrnt6Xtl8VHt0I3RGu/lUVsI+tdBM1A3X3c0C0vU4RrIZbGmYdTE
         rg8w==
X-Gm-Message-State: AOJu0YwrJBOQiYQ8B3nFGYCEmAhYxm/NP7EZ5seTq6KwYWaIrWxeO1rs
	zmjsknQutN9dS+uPxCqFnKbuvfrKBDah2qWyRB8Mjyl+MgU5E4srAKd2+n0Cx7DY4x4=
X-Gm-Gg: AfdE7ckV1AMV4cJmBCtxurYEFwReFapMqvjcQwxwm/48yPZACJpnyvnUXt+eTS9t9La
	F+KTj7LK42Bj4Oc21k4Mzh+vqq5gGOT5x0J8qWF9qgxCUz6w5kBLrpJm8rSO6yXnG12NS2dD/fh
	iG5ZbDrHIFTcT8HDb3JyID2Z1E7iU4u3cFXZ2xO45FIuATNheQDuLob3+h26hKnc1k7pog0NkzY
	kmHv5pW+wCRlMhl+WOzUqUQkf+zgorZW+GM5K85Xc00Qgj51v4idCZhgKQWyiiL75VcuNVGLsXL
	vmA0qIhC5X56g77e/27PEdSsuOG9G1boXxOXUUFG42Zy87rGgNOgGwidvDH3MRwjTvxbfo8breP
	s13K+NvLhSMQzSedMlobd+dG2qgogakPvNl2mFSe56G8L14/1cvyP0uzds7qYryIx9e9wCo2yMa
	7JTsQWHgUJHvuvyluhbo+3fF9+2Ykk0egUulMWwcuis28iPIx6091dTXrzRnVj4tcL29F5cF+gi
	IqHvzxQKyKAle4=
X-Received: by 2002:a05:6000:2305:b0:47a:1f6b:ddb8 with SMTP id ffacd0b85a97d-47df07f9630mr8399842f8f.39.1783616412512;
        Thu, 09 Jul 2026 10:00:12 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f214d2sm51486399f8f.33.2026.07.09.10.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/23] mfd: Drop unused assignment of i2c_device_id driver data
Date: Thu,  9 Jul 2026 18:58:27 +0200
Message-ID:  <cc23a3c4436796135633ca14f325f5d13c804afc.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=y7f83ZY+gmTL8dJXkT7Oh4B6CFbmyiwfPpSWpfyjPp8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NEfcCYSOITfv1Dp5UsDz1hqMS5P37nLp1DE 96T5t+BaiaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TRAAKCRCPgPtYfRL+ TldACAC4nHVdoWDo7RSzJoQC5ytrNAm+mLrCUCmRS4i8dH7uV/bRD/ngaO9BkbPMcejn1gJoRw4 iFSCdCilxA38vxDUAoqdoGxEipQY/WF1KpwsaeyvsCaykBDxYUkwKKl8PQWvwzyL3KbdxCyZUOn ENclVsXSyU0AWWEdTwDXGukwtLdR+ow5y+DI27LdFlJP1vgrfrZrz2t39qJT4R9a3CAouXaxL50 ZVb+6EMPv1apzI3ypkZ/eUMGyCDqT4KZuL95t/O3tvrduev9WSCHb/TsJjEgtaaghJQfImIbE8o aVp8I1QPhHPF/eDfOqoEhS5i2pfVct7E8kiuLd2LskiLdOh4
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
i2c_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/as3711.c  | 2 +-
 drivers/mfd/rc5t583.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
index 9741977031df..eb03b813d58f 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -192,7 +192,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3711_i2c_id[] = {
-	{.name = "as3711", .driver_data = 0},
+	{ .name = "as3711" },
 	{}
 };
 
diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index 2c0e8e9630f7..4ad761fbfab2 100644
--- a/drivers/mfd/rc5t583.c
+++ b/drivers/mfd/rc5t583.c
@@ -280,7 +280,7 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id rc5t583_i2c_id[] = {
-	{.name = "rc5t583", .driver_data = 0},
+	{ .name = "rc5t583" },
 	{}
 };
 
-- 
2.55.0.11.g153666a7d9bb

