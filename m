Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347765;
	b=ZlLnyCbgYfGj+Hhr6cHHjEY/gQPcm2B/63Pu/EwTePO2eCwslvs1L4B93tYx5kwBbPv0
	 eoeoZhaERKSM2PYbgnca8zZQ4TkO7eXa427eYm8nwFP1xz+oNM90KY83O7O+1gMM6lklb
	 E0cBAC7ynClTuEzGwcDo/a6I8lpRqYo8x4NguikeYK59KhLagBuh6Z+gOAhD3oQyGeE13
	 5mWShnm/f6CmmCp4N6FSVzGfn3onqGt+ZgHDWItLaDNDOse/t81yBDZpjDrwN6vR1SeYT
	 vukIV+XTFMSwJRRKMTO2onlVuYyTDmSOwL21N6thgQn4KcfkfTBBn43X+ZQPocgRLLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=rNrlcAZuLJeyRw/m2w/thfDaF1eAkic6L8d3Qp11YvQ=;
	b=0H6elK0girudC2AHdUuIJeaQs5j6Nh84kfcrmd9Skn318pblVdFSsL5erRaW1NEQs+p2
	 r1g3DCfJlDhZZjhuZbIGcxVCsfj1ZP1LOwY2rkdH4NdQ3F6sLADOkIWIyr3EnMlBGZbVV
	 MNUcNwrmnRX+ONkpSptfxPgJ51xQ/VegA6UYW4dGgGFtz28QKbfkGnoEPE9tXNzlopdVx
	 TzQn5AUk7glA+KMVa/dz+IjSIDxtW74bwDKSSIQviijD8bN99TyCOihLNCIptdLWmKiAi
	 DkENYZGVQnRsJB81yvXQk9UH+sY65WTxmz/BDoKvd5m6XPrWSFWQG8EHXb2h5rVa8eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NHmHTBBi;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA7560A380E
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA7560A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NHmHTBBi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso20216145e9.0
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347764; x=1794952564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rNrlcAZuLJeyRw/m2w/thfDaF1eAkic6L8d3Qp11YvQ=;
        b=NHmHTBBieuPZV6WeQPnEqOHid/Q+uDZ3debfzfKwEjhDxvlPuxa9eQgYL+o/7PyMBc
         aWgOGWF2p6btHZB45tQtIaXRQDptJhxvBcndo1mDGiHj5yYrdZs5zjFoODhm4cbX6mUg
         /8yRPB2lelh989PjZPtY9cRv8E6NWmflmpxRpHO0jSCV+IBp8sOfcbMQE7KlWsUfII9F
         5BtCOtT1WLT1RbmjEgfP8zDvenT2NRwAZ3eEZIFx85uEa84y7SQCGyPgd+GnKyv2hVh7
         TfDXAzRNZgDCu95aznrgrTP19cdjm4msnnLUsTSV7JyWFPAI9MXCSB1e0toybSkWhMqT
         aYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347764; x=1794952564;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNrlcAZuLJeyRw/m2w/thfDaF1eAkic6L8d3Qp11YvQ=;
        b=sm4xY8cmqEKQh25AHBVi7arM1HSjhZVNiqfexRh/0N1GqaVfp4pt2dX3RYYmvr7MZk
         bK/6NrTCdHt+kdSzLUnzJv8jU0ZutnD/0MqV2qJffNjXTKU/vjQDcGh3aXKzffjS+Y/N
         xh3agXRrEtPdm8kp6JxfUAHcX9UkUhO78WKnf+ZUhTuenyZFlafX51beFcW0/jLYivtv
         PBzOkZMRQMhnCpEXgqJpQ+yyEWlV0koRJhVlQsY/BDd3ZzCsMHIcv8hbKcvjb5/qYERG
         8ezWmItnGXIn0WymuVOsoQIGnFlDqJcSGsOKupUq5FM89JUotjNZNdP9HS3RHnuyi9fB
         DJ9A==
X-Gm-Message-State: APuU4Z+aOGQWhE7JDV4Nl1n/aO+DoXW5XtIqeZITH1ZazMN80Kzruzw1
	Eyj1AhR+tXHDQpm347iNaYKAv3dXiJnN5GA9RMTmws5v4UUpRhtBkOQhuU9wrqzcAgk=
X-Gm-Gg: AYBFou1YXTzy3N87xxCEpsJvJcxgb0BQN60d1TNGGS9WEDMnDc08u4MufP90kOch5xd
	50aMuVpLPJLv7hpKeQ/sdb8BznBl6vI4kFiFQBTyFsKgs8r3PaPFmkQUo2r+JecKmqV4aipncd/
	gC2B1H7VRY2Wh2I7RlDYKtLKAyi9QsoSEbCiXx04CQxtfai8euUhBpKR8L9jA3s4Nt9zHF+Bfgu
	UXRaZQ7dTfaaQnQ6irsgTEJGNJFAV5A5MMfk+fIc3sJGfuzfXBs+EwEQXTJu2uXbL/Zj8H/c1L3
	pD7DpEARJEvdY59p1T8SVzou+0rXM9UHErBOH7TEDymbbxQJR+SH7aEKFrlwIPPeUgOvZ6EQSn/
	LeGD9TzUbmbczIQIJuuJKH6O1K9Iospx+RwHh2zZaN16nafhnkDnobOopU70PDzvZYE7POd2lzp
	9ZiaoMNSwYL0lmUA4SYrsbx+axk7wKvfRt7exF+axIoq3S15upKkWPgRRyludfGJw0/1sy3PStr
	Hx0cLRRwlxlWd11MptRsM+9WMari9V+0gjptp+K70OOBF2X0ZznARyS1vaMQ4PC1stdsBqEiqXa
	J50geCGMOyDu7CAz2F52JdMGiOmuoxuu8s4=
X-Received: by 2002:a05:600c:6096:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4ba093a9ef5mr6309465e9.31.1794347763914;
        Tue, 10 Nov 2026 13:56:03 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0951bf2asm4967525e9.4.2026.11.10.13.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 06/20] mfd: rt4831: Drop irrelevant __maybe_unused
Date: Tue, 10 Nov 2026 22:54:31 +0100
Message-ID:  <a87d5107217847874288e449d6deaceed75fb4c1.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=9gNbvGYoAa+q3gGPdNzcQyQQ+ahD4wUVvnLMfUL00rM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KnbfKH19dsaJgm3Q2fWsEOjjujGv9qotm9h uHzLrvMsIaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSpwAKCRCPgPtYfRL+ TgrnB/9uf0GcQv03G9aE54U5xgrTkWSuRx/DGGy6n2RRbA0flhoUH580i8rzX8oAcCn1poArm/n XNe24MiCSmBI5G1zW3dseDAVjovrtJYZ1pwxxDpf1XASzz8dNHyyqQvW9Frt0IwjA7YjIyAUhoU 7ke1MumJ+dPMg4pP2tPcA1Fr7Q5FTZ77W3s0Ft+hFjL/DDHcXtI7q/kJ20b7R+9lHKYKYhftrIJ JMps4s5vYjZQ1qfb36nQdBl+ChwiIh6egKU+hf3ni0eUG/VtX11mlV6GvB6fW94gsQRP1YnutEG //2FMzZZBEgvo5q3Ll+22G6MYN/JuPOQtPgSNFt39fPmztil
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

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
2.56.0.rc1

