Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE5A45519D
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049108; cv=none; b=mzh45LolnkHHgF85G+hUm4wZo1ifiGXEnl6lD3uybyVXalQReRZxLCFaQoMiwagXDjLXQ6lheaZ4ZxmpOHdWFvBOmUzqlk83raSJ2yMhH2moiI/2iu4ISiZMX480h3FjmtMwQeK/GgtlIt9GmAjqLYVY+24Ep/d+xuTSA3nGS5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049108; c=relaxed/simple;
	bh=MB7LGi5bia5b4s3lqho08nciPjjAh60PaTv8Fxk69LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2quut/QtUZgvRhc0M/Ht8QVEQf1z3uLCYYHXtzS8cSnpc/pjKDoJ7yoTcb0XZTCV58ALuO/XAY2ByUZPyHYRdR4dhjWzKw5HgONz1UQ7fVk0+a1eM69T3UQIn1yCy1go8jCwBDPuk2cG2blocxZS946E8Em6oWAJik/Nqj17P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=LNXOOcm2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="LNXOOcm2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954df200ddso31774445e9.0
        for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049105; x=1787653905; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SehFAIGV4EScw1eNaWWBsUyEtfJAkEOaG1RHubt8kHo=;
        b=LNXOOcm2Lk+fTDP7xFTgB0LTWbfcpv1rFSDTuRgu/Z526DqMOEZa0JcwwA2VHnNiKE
         G7UTOiqxtOf1297pOI5UI08LU2ozny2Ev09EFO3knkmahOG7ixRCs9wmgtTHdGJJMwAl
         ZDRSmJxqj7ERe/7DhvUE3lz9VsIz806pFMuH23ZXDzqXit37fnj71qf72elKoN0nXQ4k
         7wFxQ7uod5ZRauZw/bClbiPYD035v8AjBYb3WhPeaXWRcd9Z2vcUXxkFTWGjE4ODK3l/
         sdR4IvMvP2ilnb/ufuX4W00+JN5zQS42zxOj+/E53P/YsnO0HfDCqgvmvbFO+sC0fAkL
         NgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049105; x=1787653905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SehFAIGV4EScw1eNaWWBsUyEtfJAkEOaG1RHubt8kHo=;
        b=nvSpovTkPtjxION3ucG2ltrhM90y2tQpRDKdOt03wAHMjbXZt96J6DuihRnrw2Lt7V
         /y3vrH7SQq9YRofFBciYVp5c2A+Gs5u9x23dYErSslkHTv0FBML2HBuHMxQQ+NF1Fxo7
         /dTuw8B3GHhQSBxDEZAhDXJ/FaKlx9ALuTTNBIhiuzhKqH4joeVhZdknLAAzfNz8ZKkZ
         exZ5YgQDnJ1q+uroNnMUuDcosqAN5PgFssxTYTBjpo/Umk8lWLEosc4Ulu1He9IRrVEE
         n8s1oYj65q5Ipz3VJ6bpn1IosKdljGkZ9uvE89duSAoMz53HiDRIyMBstqjLYVmykdbK
         sYXw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6GgZWUv0/FXgwf+xldHhWrWmMRtUBwJwobFtrm/DF8N4PbgnG1HYVTr8Q+ObruGQWEGI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEETxmbGl/V3fvOiNGjDYzXChszCbx2/1cm5jXYgfktbx5t6Un
	RKF5lAzVRdcVE1iQwmPFmTs0TT2jUtmUyRntj6dr6iZW0B+5vqeCQbzut51Jwhjn5Lg=
X-Gm-Gg: AR+sD1125Tmcbg7Q7LshK+Vn3VNmU4BXAhGK/vwMYG9u7mDU+x7ASKBjlHdqV4bDLGH
	htynLqbzwiZSO8u1ehfir9M76JPWX3MmAgwfAnD5SuKdMkg2wfVScApGhygd1mq2sm26xRgIz7f
	KT7IxUPLRR6IUWuVYTDuDfDM3TPEewj/e7Jdzf8Gd/SjNYzIbPWBtEigfJq2i4j14tQyAWgHro9
	2uxFDZtIZ38ZHCwqMgKXtUz3+uAvB3nNWXcX76hLCmkwMdG1brMiP9D4YOFRYxQHRG9mbuFkdcv
	BrAa/BmHCJZefUat/6BXJ6wRdjWVr7H9PvT+CK58hamcXCkowkCWjX/CW4XLlbP9OQ9WmwDqX5j
	yy4iFShbFVL8tpVJU1/MhwVbYjIslU97koOcQAx0CAiMob88FvTDU/BMh49q51Uo9xbNWJ6ZRIY
	hq6btWOHQMq5w8hTeiTu0unVIQ1PFK60i8xPhu3EBbd4ju3GZo/FAM8XQa6XkdKGM8WK+8hvhkX
	SwykGug4q/gGEnLu49npjPF0pQG+eOfU8JoTA4hqzgbJ3aTj0O5JsnGbske
X-Received: by 2002:a05:600c:3049:b0:499:781e:25fc with SMTP id 5b1f17b1804b1-4998792e359mr338967655e9.3.1787049105086;
        Tue, 18 Aug 2026 03:31:45 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:44 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:15 +0000
Subject: [PATCH v6 2/6] serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart
 compatible string
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-2-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2

Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 26fc0464f1cc..6afa2f4057e1 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2400-vuart" },
 	{ .compatible = "aspeed,ast2500-vuart" },
+	{ .compatible = "aspeed,ast2600-vuart" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_vuart_table);

-- 
2.54.0

