Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347770;
	b=EU0sTq2pOLgrc2emPFO5KslHRrwBT3enYawuiGZuP5RbkIBkcpnUEyn/J+Nn8b687/Tx
	 p64++j36x+ogzsWi0Wdsq0rdvdAfG0KFtqj5BAM8yqDH4N2/ffGqbOEp4LKC3c+moHtOM
	 SnMr5t0thSnHy4V9nC0ycJu+mHmfPHdfJPIza1DfBp2mhRL+NAp0gF3rsd1+ZW5cyMCIO
	 zCHJ2ZQ5/1Du3GUzlhaamKTZRjC5YEM8N8CJUrq7IrU+JE42neFiFLcgnnw2f50X/45lt
	 stMNUOuBOyLeyI1VUuVJg21BCIFR4BE3XRedc07cfq5gTm28zGCvAX0vJmYpc/1WXAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ywbXjKHTVVvhV0w97MKutLqW2Kaqqz/b4ZGRe0MSLiI=;
	b=DEcJXhUj7ss7MN4pfxIOkYu1UJe+bF+VxBqidkMdYsK0NkFAWECZ/fcRYrqO4V4cZq9D
	 3yEWThjYNDi84l7zicY3euY4TAzuM5JmfRDqkWXyJkriYhpxsbfxnkD9NQ6xTAws0Dq8M
	 FfCGchaV5ggxu7p0vH9b6WFwmoSdfJejVbGfz/5ClCbKzYaIxPXkhhBjC0bfPvTCvl8X8
	 CA4In3D14kVwU+Qo4AmBmDHEUzUdsbuHHqpBlCfPgFko52OPLarHh311lhvfOuSi784LC
	 OMTVhoiNmq1hwuoxMN2bLf826LOs15afbcl8ev3f2ep0nv8qnRPjYRvOXLUGv56mj/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TjL0obGJ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D6760A382B
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D6760A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TjL0obGJ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1744370f8f.3
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347768; x=1794952568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywbXjKHTVVvhV0w97MKutLqW2Kaqqz/b4ZGRe0MSLiI=;
        b=TjL0obGJL+e+oxmgaPQZkJRYFnia5fOhdwVz0FfLsM9UcVz6ROwUxHlSOWDGw0f1bY
         jGM7e/dOIYzUOYdexCa2elFHcSvWz/rZ/J3TTmV6XWndP9e3urYm1MtanyCczISvouIb
         g/KRof/ErWPYRus8UaUigKmWnMQv3/StpL6c7FNCngyR1geIaHPGE9v2vPrdphl6Ln49
         MzF3RMil4D5RG/jycvagsMWIoBPCgXe/Xpl8298EICLRZ6fZ53iJHkaAv1dxwn6ZTVS/
         EMZrYKLp3HJvyWtm48aIKx6k/csWg/uNNfG1ILBAxfjoiC60Xlf7DOBwoSgO0O08Uh9/
         /TtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347768; x=1794952568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywbXjKHTVVvhV0w97MKutLqW2Kaqqz/b4ZGRe0MSLiI=;
        b=yHnS7P2rDzYGXYwq7KlIAyXFQuYFMTfb69JP2XNUAQ0DCgNqtl1/3yAq/hzq/L4vct
         2oQu3pHSlusWYSrqQVS8cs72OzSmEdap8hqCEkUiAzq5Kn9Fh90fwciX6YskPUHLwScz
         ah9A4PZmDXnQAvHmB1Q5sCT/i8SUCklQtxmdiDWkgaEkiqCPqaBjXmuNaYVzz/Xlgi2W
         /ClSaj/E1n0PRq9D60G+G1lmhQoqRsvMlzT4jLbrxhW9cSGjAjwwtGQJH3CdM4Dm+NIJ
         nn4eVGYTG9zewdtha1AJUcA0MAlW0SdcjCWTkYRcURJjRaUlMWXop1z0HVdafeP5aKVu
         5i/A==
X-Gm-Message-State: APuU4Z/Vtn1AQJaoJiF22PX6wd2EAuXuISiWErGn3E3qUgjoSiGfn2UH
	NEvOLmKmHBfAGz0bq5Jv6bTZnyWJhzHmI1sYexUJvXWLsv/tJRojI+Wr+3SLwV6CDME=
X-Gm-Gg: AYBFou0ZMD145wTrwXLBidpfQNEJkyQoHU/7l4medTgaIGnB2fCFMA/P3YC/iLWf2fz
	r/HMEziHusF9MSeX1fXMeXsg/mNRwyOWfD8pqhOIXUcUD4ZnbCqsB06twYexPxOFAoWoak0E2gb
	AHFxuMvrD2sC9heOHBVHtKwBIqiG0YJMfxa/N4fAivdT2/fv326iTyMjTzXS0vzWeks6DyybawJ
	e6LQdV53m+cmbxxsOvoeIaQHx0vFnGvN5PTURnHgYTSteqWOA0OkYO8A288srmq/1FayGhQZUO6
	4/as4VOQka1D7SUGtvwbw7jbGpb/mTSffPJ0fCSZVkIkV3b5thv8+jLfpGGJQKO5rJv8MsDp6jr
	wcA6UMZPb82X71l5JWjQZ1dZ1RsWpjQmVfo5omxaB4BCC0nxMen1th+Q/X6mFbLlQk7gOL+3x14
	ShpSf0K4qeiahXcLWW8v5SXIzEDedP/QYIkX3knkAl5WVpsoVjX5H/qGg/lVZyEJKS4V1lR/Ly7
	OsV1hQgWO2Iiy1DKFO4VnivVN3uLemhXqVesG1K2CVlo7dzVyZXQKEVvhNdqrcUszf6x+zwMfbt
	CAdHlLvn5JBGaAjDO777d9nPjVhi+zCe/Q==
X-Received: by 2002:a05:6000:4009:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-499c83bfdd2mr378751f8f.57.1794347768350;
        Tue, 10 Nov 2026 13:56:08 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49884b99869sm5875523f8f.4.2026.11.10.13.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:06 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 08/20] mfd: Drop unused assignment of i2c_device_id driver data
Date: Tue, 10 Nov 2026 22:54:33 +0100
Message-ID:  <ba35aac0499a639d932c469980c54cece6f2b29f.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uPjQrG1A7H0w/6+LvdAyidw/O4EgaW72iKmFqIqGllQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85Kwdz7BO7sNUCWOELWy80Hc5Upvw5w6/ephS ejZQYGyZlWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSsAAKCRCPgPtYfRL+ TpJbB/9wovb7vWaRT/LSRisXFys0VfB8aEFo+tqCvFXofFJnzu7RSQj4vZhzX30PAkRB+frmyy5 EKARJVjXRgAyrTtSJFHxtYjUFek7P6TcpMaRZ72mTPtQQdfC/HraNlKuXQmrAmyaOzeMh6BwUHq PflDqjM5g1kBIaxdfQjdV9eSRyPHIiemZmJEX32nLLOJpM6xHe+dS5TrZOsfWlxKBhNAJ9K1/JX KQpqfoS5fx21UtpYg8IACdzf9ysmEwGBI5xJJoHPors3m5LyEEXDimNkP0OHJKun8CeGmF21wSn VBC0tC7xmkJ6ldTgqNZrMDMjtZfLvsja5mnudCXHLXfBwZHZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
i2c_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
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
2.56.0.rc1

