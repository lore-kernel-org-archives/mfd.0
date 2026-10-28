Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153859;
	b=dTS4GglDEnQJE0ZfRV2wybLNK0HQXUFph38p8o/PSzxFsvHJVWEI8UG70cw540uAnn+u
	 6l6GqK4I90oSQnM3Bf85iAUwo56QQf6BHFr0JhYOiyYwG5k8woehCPt1NRcsuZDpPg8ig
	 qnuPGXuwwIh4auz8Vmplkl9S6rIg6HOdPK0csl/4fCE4V9kzmKzMeZOmHijg7WDYatVrL
	 Q7qX4thMLjcuWjBq3/wTrPgG5PD2izE53TAhma4y5JMUpCzGlULdhTmVl3AZf2QNfAAlM
	 OwjhrORpDivaWhLIiyW8bFMcit39yksWAX6gZJxa0TEHAl9V17LgrI9Lkj2tjlo7TcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cP51aETFJLolZBQiqlTw2VFExTNDGMiywN+ARlpv7nY=;
	b=XMdLmRHgjdkkcbZfBwl+t2n27jHzyAZnbgUY35sstEkoKdd8uwYcXtkHedKV6zr98WV1
	 8vr7va0XEd5Py/Zrky6DysY5M5P3dNww664t1o2cGAQ48Pspsbm9mNdMslDBxMpvlthh9
	 PhvX5/w94c+rI1DX0r7tmpjio8hyRzCiGLHjArIrg0ezO27JbDzn6NgSrW6rXna0VXmyK
	 Dx1qpXBIKeHNwLutmLTbtl7r3oLz2U462A3HBJmAdfDAY3hiD3UeJEyuVKOWioescgACJ
	 OOG5AnDHqirScHReLHU3lHmkALSR4ZUHkg1JwKX1Zp4+BHEq9Kz4pvvzYRRguLjw1hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZK6++0G;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95865606A31A
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 02:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95865606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZK6++0G
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5364c951da4so5620821cf.1
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 19:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153857; x=1793758657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cP51aETFJLolZBQiqlTw2VFExTNDGMiywN+ARlpv7nY=;
        b=nZK6++0G2KGWwbR7aEyVuVjEedJ8vBa0XlIr8Clms21wHbmp+h/TNu2jqXM1a6gk4K
         FBHyTuWCpqn6uCRZE7/iT+FurfGz9QSa8CoE3fs5Em1SJtJk0Fag7Go7Ihummb4io7lf
         yMHcVl65bJzGzsaPnCLJ8fAqLsK08Vbo5VGyTM+dn1Oj1YO0kY+2WM+TiLrrvmoJ/s60
         hVtwpRYyuLMVdgadSXdpXhqYjNmW306hbYiF5WbHvYVrufqmhS5/bEfCJoNa1vUoeVC5
         xwadbDlX4gjNRr4K4uRuxIpcqQ7srcPy0t3XLJg88GqUZDbDxA2NUXWmlL9Cp9C77aPY
         ZFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153857; x=1793758657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cP51aETFJLolZBQiqlTw2VFExTNDGMiywN+ARlpv7nY=;
        b=Bm2qu1L1NI4KI5znVOS1ON1NUGpf95RnGU3gkdP2CFL3vWUTCqoeq2FxEIhauPAYYy
         gj+qAlIuuFyTSD0qk1lFgxkcLvYx6J+RfSaBp9S+EeXp4aJJuNBfbdV5q4IQGMf04uEi
         prhYqruKDjej81i63Z0UA1CSHjxA9WBtwBQ4a8N815KnU0kV8rn4V9TXVllcK9EuHwQJ
         19MiukaNjbbLvopiuRD38xmxFyZbp0XQocfRZqqaN+tnAbolPtntaQc8LDRJ8LrcaIpB
         3cf7kqkPjGT4jFivdZNM8ltRvi6X/3ot846fjmdNEbFuVm8KKsE8TFunw+Jn7jDgcKR5
         PrHg==
X-Gm-Message-State: AFq9FYIkno6Rnmq1chpDshuZWcjws9VIacBFY/Eyfp5Z/PPfhH6dl9NF
	Yx88nuqGzF4h3NIoheX1oD9NFqKuSSeLKYTbIOBnQa1Rc7Hw4ii2msvZ
X-Gm-Gg: AYBFou38M4ezSkFYpJmSwo4gPhHv84doWbx6aZZt5V4pGEzZYnxvSUAJMB1F8DsjDKu
	XeDakAiC07exLQ4rQxEYNCIJw+X+SekWrZm23yteYY+YV1t5y4GPgxwxBh9A6Mn8vH4xzNsm7d9
	PLrcpVAdQLF8DFKZ6smhicC8Hu2C60S98srySlCwnqKV/I5fxXQkeFVV1jjvPRp7v1GySDHkTJ/
	5h1bgnyAcVp9Bube/BOS06RsZ8TbUOv0t0LytdeyKQlbf/E63WtvmjzyIoicMJvQh1XWNvHxgpH
	ifvoBdNJHltzFqGV1yLu1OnUPHdEAeeuzSzzspDX5b2E3JFvVTLbbFbPGMkGxHf8D7ayizVo4la
	Y3YHb5z1Yl2i2fyz06fkVJX9hLt3p9g1aIVzrDQTsFH5SrgMwfjTIb/5mpYHn3k6+V03SWKZdF/
	65WCGXsy/ZVFxwmb80D1+IhlRpBR363YnVIg+dzCHEQd7hLJfmK+i3rmyqWcwq9wLVeD8uHnP/K
	wsL13lPyyehreFCVgM3ujPB23l7XAzLkivelZ8pV8kndYUuz5F/HDNCseI5vsWC3bIFzQ+lEx0J
	rFL2Y7juOlog3/aCzH160EAExv4hm+qlXRKZ4fYeaDT8BLyxp69QelUB/j5IsRukymTUJDVZRfN
	KXZUtG4w+M6cbH4bNNRYibMyVHJxlm7oGjtzPa8sg+VGE2aurUAFvQ3gYUocKltEr8gT7WeE26u
	JDpW0bO4BH+9Kf9/zrfsvC9/R0HHayX5CqDAwMugGq9H0CnfySpMZkte0=
X-Received: by 2002:ac8:5d8b:0:b0:536:64a3:aaca with SMTP id d75a77b69052e-53fcc6caf38mr19690551cf.62.1793153857267;
        Tue, 27 Oct 2026 19:17:37 -0700 (PDT)
Received: from localhost.localdomain (wnpgmb0311w-ds01-161-139-200.dynamic.bellmts.net. [142.161.139.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c96375sm119234946d6.33.2026.10.27.19.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:17:36 -0700 (PDT)
From: Riccardo Oliva <oliva.scorza@gmail.com>
To: lee@kernel.org
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Riccardo Oliva <oliva.scorza@gmail.com>
Subject: [PATCH v2] mfd: dln2: Clean up dln2_unregister_event_cb() loop logic
Date: Tue, 27 Oct 2026 21:15:56 -0500
Message-ID: <20261028021556.11988-1-oliva.scorza@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179198398105.839288.1873130512029656566@kernel.org>
References: <179198398105.839288.1873130512029656566@kernel.org>
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

Streamline dln2_unregister_event_cb() by using a dedicated 'entry'
pointer to store the matching event callback. This removes the need
for the 'found' boolean flag, restricts the iterator scope, and matches
the pattern used in dln2_register_event_cb().

Assisted-by: coccinelle sparse
Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
---
v2:
- Rephrase commit log: Clarified this is a cleanup rather than a bug fix
- Rename 'target' to 'entry' for consistency

 drivers/mfd/dln2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
index 0b1e7fd7f..2a9d83d32 100644
--- a/drivers/mfd/dln2.c
+++ b/drivers/mfd/dln2.c
@@ -157,25 +157,24 @@ EXPORT_SYMBOL(dln2_register_event_cb);
 void dln2_unregister_event_cb(struct platform_device *pdev, u16 id)
 {
 	struct dln2_dev *dln2 = dev_get_drvdata(pdev->dev.parent);
-	struct dln2_event_cb_entry *i;
+	struct dln2_event_cb_entry *i, *entry = NULL;
 	unsigned long flags;
-	bool found = false;
 
 	spin_lock_irqsave(&dln2->event_cb_lock, flags);
 
 	list_for_each_entry(i, &dln2->event_cb_list, list) {
 		if (i->id == id) {
 			list_del_rcu(&i->list);
-			found = true;
+			entry = i;
 			break;
 		}
 	}
 
 	spin_unlock_irqrestore(&dln2->event_cb_lock, flags);
 
-	if (found) {
+	if (entry) {
 		synchronize_rcu();
-		kfree(i);
+		kfree(entry);
 	}
 }
 EXPORT_SYMBOL(dln2_unregister_event_cb);
-- 
2.43.0

