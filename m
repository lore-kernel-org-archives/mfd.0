Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347773;
	b=36OshapXt6K/x8+Cr4qeK6CXtBTNxUDXKYF4PfgHx3bJ9ZKvWTYEcNRNdmgm279fE/n3
	 xfzBX5/VdCWHrTOmOiFIEb+gvTXhimDaAE/aw8alsIW4sezz4k49IFWIjSjqkgLahoYbY
	 Ixnt5qVZMEDCq7uJXE8lGlTRJhFc+Q6MO0rMWoRqe52IcIEZwENeoHzp3VjCfLKo8YXph
	 5nvU39lOR//aMiofFqZLx08XRkGnnZ7yW983yvoLzO45AcoLVQqpP1xodudI4W427JNAI
	 lT2EBGZlEPZ4Y5QTjz/wyFBEirahBXcRAIzchESZrqYlennpDMlxFmuUsbl1kRicsEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
	b=ZadNyNFcn99q9ereLK5kM99L5vkBkJOJH3+rAu4XNa0vOXQm7+RpxfBcXkKQDMCVRRQL
	 gdvs/Dkf0EdHqKoTDrstgVsIVV7U+ugdxW/xUCzvN/1y1y42UwrGMGQfCcYkBaWPhIMQ+
	 ZWDj+zvP17kBmqzcNX//HYHjgOTXb3wz6nJ0DdtaA6TBFYu4aiOjIt3yCfKVQFq/Ok+PO
	 nn+S/h53Tnpindmz0PED8h0ut7kTmYe8iODJk6AoZoxsQVrRBTMF7B5N+l5ha4s4aMNTK
	 ZN0E5ZZmbSqjzEEF1IbK4x9GbUG5bJ/Vb16HBFRUqnykMNDnzGiCRfEFe8Pn1Qg3ARA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V2sEgv9w;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7AD60A3836
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7AD60A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V2sEgv9w
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so1573747f8f.1
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347771; x=1794952571; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=V2sEgv9wTxipZf+QaCyXcLsbX/fSlRDy0gTRwWBLhb+Mh/mHaHh3pc5dSznM8gbFuE
         9L00rZWzaEdBtq2C7l+Kh4UOF+Azl9sWX0i2CC96Y+/Q0E4zJA/Xhe2FdJPbKyGEmgvE
         DZ7Auy+qTa0H2FGrkXoJIYFiPLZWT/bKxC4HJ6d+3OsMEyjIZ24wKS2VhdhWNS1pbwS1
         5PiBQP9ZeZbK7MWV7YwYgD1iWDUINQMP4yTXociaizu4vkugkzTMvx9FWPatuw8R+b6X
         6UBdytDK7V7TlKezaW4XAUQTTO2KkMH4ns6f8ewysXKxNzoqu58zImKwOeBunOeLdy/D
         mFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347771; x=1794952571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=Wm9pP+V9RMT9uOj8szC7Lfu9pvUk54yDnTwV+glqY1CPcZxzYkQkWXgOV0PGx44W5T
         zl7xPt4qsohNii1WQSHpv1q011FKdUm8aM9FiXUMsbQhaYAyZR7Gx2b7+GZSyohQWePt
         dyzlDhwTuMODJnXydDmH+9C6uO4pm7uj4lcwExGyoE2EWFERiY23nHVzvmhoyhXswZze
         qaLtsdjvkULQRmFGttas6RjmiWQWrkryP2mKpJ2g8lrJBOocZx3m1ZcRtCUW8EXtDGPa
         Dj4tKq6nHpi0T2vLGgWHVTlE9WkCLt7ncIEqHflHlx89wY3wEUQADBvU67ZI5P+10Ksd
         8PKg==
X-Forwarded-Encrypted: i=1; AL+hErESbjBxal1j7vSJquwweFH/LIwSXGwJ7vSoA1P6X6Z7p1562Autfjd2m+dkv0D4vh68g04=@lists.linux.dev
X-Gm-Message-State: APuU4Z+E6eqouSC0yFLvGkNwUu0KVMti+zHhQo/Y9yk+PQPel+RnIALc
	x96FourBo69Q6ccc0Hs6DgWKLELjhk+lRUZGBYlV8AcbHx16F2T885P4MSXFIXYMGQ4=
X-Gm-Gg: AYBFou16VhEIIg9qCflNKQyyhIiHcwhQnmOSpdWQZnIW29wBIfOWw7SYKbWnNx0gXSk
	onGHZxsnpLHSHJNK8HIxtWSm/AbgPJ1q/zy4ujp72k/0Iqmhhxdq48fhfYeGMOOl9ua8tx/utZz
	uLtlqXF+OaKp2FmkoOgTpOdF9JDB9T77nraRkcPFaz0pXbooVs5GZUZN1eziD8kvTEEYH/tTXuR
	MPEbxvs0JolytVEmc7wBnr8uhZHNpaOHM1Ph0e0TLfv94pH9FhiXF/73zE8QaLAb391zpGhiiwl
	r8g4I3x089CUySuSIK0sVpm2I37zc3e0MCPVPqkHMCrXZjyQhGwlHCdfhu9X8Jy73/Jo/aaNeIP
	WKNKs+EsPBGcp/ok4HUU9KRSqzOBCKRX6zEhoKCo5g/dpLpneeNDUDGhxaz0dvKURciGti8S4aX
	UEqidqmDhpjhEkUN6de6XIh7y5heMeyQQhvuJchaNka1kTgGvS8Y/PWfKJGtoqBLNUI8dk7o+Fe
	ozkRXk6tsJT0Jh5A22uaHL0n7yDUGlDZgzyMo9KFGj5QRZGIr8LkpI3ezSUM6FtSIC15c+1f/At
	fJUuQxPfe7/xZo0j8pXRjbgywqpf3SeLXA==
X-Received: by 2002:a5d:64ed:0:b0:48e:6f76:dea2 with SMTP id ffacd0b85a97d-499c69cb701mr366245f8f.38.1794347771565;
        Tue, 10 Nov 2026 13:56:11 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835858f26sm7338595f8f.18.2026.11.10.13.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 09/20] mfd: Drop unused assignment of platform_device_id driver data
Date: Tue, 10 Nov 2026 22:54:34 +0100
Message-ID:  <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2UUtn/8z9q5Vil/qWmXv1wRJuUXUGptLBomjMZQsNCo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85K0kB+I64ERD0hCsZyM86WO9lk/0iKPumZ0d RCE1dtnaRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOStAAKCRCPgPtYfRL+ TsofCAC0U2NJpKBqUl4okY4yooT3RlrkPcLeu3peOyFH4ZcFWAIRXbvvYK1Rm8+rb2RqhkOd8A1 sc0aSu4sqf/Uwz35Y7wKCOWUS7OFm3VoUfj77VKhXpSUf0LOXB9IZN0tf4CLIZunj4gS8e0YU/Y 736EXRz5MHk6g+CxnOLM/4N1iIVK31WRGBx2V2XY41wue/5cWWHY/TSL7lyU0Q9y1YPbKnd3kz4 yuJYdJAnaJtqydkGzFGZmtJeTHZauzOGUevEieD/vdxCKTlYsIBIfOqgOTr+AWvxgcAcQw+pNue UyErdr8iUXRmfPkuz0yG6yHCdwBgMmipkoax9/lKTDAr76TH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5d5f816492aa..e74936ac206f 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.56.0.rc1

