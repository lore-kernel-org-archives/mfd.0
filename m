Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612950;
	b=yGmgyHHZIVyPTEdGcwRhrLuGrnWZOKHrb/eCKXcqQP/jw4C5m8b/39pTuHPvjLe83Rum
	 +sI1skUeNpy4NNxe/C2TTia+wUF7oZBLeTGhrkFzvGvQiYmlVyIQizySIId3bcYD6VbSq
	 DvDvGaB9mxQiP++kFwIlDICG0psGW9vQY710SRuYwq4zuWh/Dmuy19ybGh7hQNiQWVgMU
	 08BgSNBrS1tAkYOMKJeAmvtJvIpRFmuRVgP3po5d2R+68hhhgqtfMQtBig0F4A4LMxkX1
	 ckr/GliaXW+mWXAOSVjPO6wdp+UQoBes8QhTlh12dAWiFKZwHpupsdVUxIp5/5K9X4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=;
	b=e3zqhZgPrXvHNDnpb4kh1LPuEqqFUChTiGifJ/nx0ohlbhqvajJ1T/lOpNwj5+vJSfOR
	 f5M47t1cKya8/0m/26UbMu01IuQMhBbuFI6dXADd3GsExnEoDuZgAx0FgEXl9ZsfyNo9P
	 lmj7ganBJxd6LmuQL0XjXehSx/l/DQ5Y2mfD8k/VokIU6U5lcJjF11Jenw9GXHT/AZEq3
	 2jrBGZuFqkqgfqRzK8R4v333Iiuh3TUW7wTyud3IkOmrHpcXRisuAT6+PCTlaa1DFYegB
	 55nGL4CVhxNqOLZFKkW3m5kS+nOSEXYbjOauZcdlim535eZc7IbF9kv2DWTUF72X+DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VzY926FH;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33B606A330
	for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 13:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A33B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VzY926FH
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso1767401f8f.1
        for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 05:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795612948; x=1796217748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=;
        b=VzY926FHFuOzB+TmZREDNa8vzBVpe8wMsXflk55v7LMgzYtlVMfGv3EgcRkf8wy8BV
         Ysl1j8CZElrOArn47GVZ88hQ05aZJDcfXfhrmuQPEK7oKCFOsjASVbnxIgRQVimDUafL
         2r1nvLKGy/CNwHpnaQgZLEZ+g5pKe5cjzildEPCkLIxYDq94gkn467kuJu8ZphYtzNWN
         sdr5uXw477vlMlMaLjQMUYfQSrY+lJA7lNB13SSb/o0EDzntDs+JvRADsagJUAM6XN1b
         8tbN53Mafmj9is45Y2LMfxZlLRtYVjZoACcSH+3bP6I0Bnxh3LMie3iJdFGUboh2eg4i
         0gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612948; x=1796217748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=;
        b=e9KZncKre6U9NKqNXD+8i+YLIPRMfKaP42Xt9NJ9X8n0niieskbbMXys2dDQnBTiFv
         gpMY8Q+foCZMlbUOzolakLRZl4titi8kot1nhuh5NTUMRD4d2j2bc0O7uPvv+0N+sbOT
         UHIT88gjcfJMy8knOwzKMSdhgvfeD/+360h3v9N09kDqR9NphoJOtkdCZMESfjidSxuv
         A6LTvJQ59Mc/RuAadPsW/qM4q0COG9soF//7ZNkrOGLtUaJQrtt/Q7CzcMUT2/pDRngh
         PgN/xrg7piPAJq+aZb2GxhK1mOsWDrySdr3ttMiYcJea4Y9UTRsWH0A3gerNxQDABd7R
         yIxA==
X-Forwarded-Encrypted: i=1; AL+hErG1gzDz8PRFPJBSKc8y1ZniCBh3beu2Jd0PrHat3pIWqiriAIInfIVJxUyCNrunjSNt/o4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9yCXqC5jqoY1+1m7ep0mdj3+B1lmbG0HVUkKrOqfcSheTHbk9u
	XIZyqvlzQjUACvA5mO6M7SAzZiwcz+PQIGmNX9B75DItmIwyQs5xcJPk0yvN3+82Qxo=
X-Gm-Gg: AZFdTZd2iEi3eGngtLSAOrKrmRY+dD/sMSAysukQtwG9uYJkZyn3ri5mRKLTXz3XPpP
	AO+pfwfRjXY2vlSqfacfrFwDhPBQZtI6DiYJO1cLDiuZgzulsmcZMntcT/8NuEZ7F+vLywpWmqt
	Vd3uT6dqtyfeOidYweOE+24yKuB12+2RnrCQfWbqya7iif0AaRS1QwBcUr/VJly9703fDF2rbNr
	S1sGULVP7QrzOW9VrDgvWvpxJ5hKgTfHGxV/LeqagQMPwrYuS4aZaapphoyY/0ZQA6lBDe5PjbT
	Y/9HiJpkZPRDBf3kaLOaB2efj1Ucuev4Wa/WfOkrSPMf3TUQaxnPMqqu8d7Kcw+04j5XlzD665m
	BXbfdw2Yb3LCnqBv26D8kVFc7jw/6cJdwrZgeh9WIsVWID1Pvn67aHeuHvNpq45qoJlhIFo8eAO
	yHF49RaJ5I6Oe6lI65N9C9ugRDTW5YF0jvVdD54CSwYfFJNDMusywGvQcF9QNPc28F9c1Fi2lWj
	RY0ao9XDU8/clNGZXWNoRs+XhltbfLoF3Dx9f2FPHoznW43c+cxwPH3b4UotWjo4iT3dWEdfcB/
	0PXy0XWFJh4LhX21Pp95gJbuNlJYxWF5QmRaAy6oQE+sClt6wQr0PptQzJs8tYmaZX+FabWuo5x
	l+RIlZXlOmzlV
X-Received: by 2002:a05:6000:29c6:b0:4a6:56b1:cfc9 with SMTP id ffacd0b85a97d-4abb41f4e0cmr26210426f8f.22.1795612947363;
        Wed, 25 Nov 2026 05:22:27 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm34944259f8f.53.2026.11.25.05.22.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:22:27 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: st,stm32-lptimer: add resets
Date: Wed, 25 Nov 2026 14:22:25 +0100
Message-ID: <20261125132225.90891-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The RCC has a reset line per LPTIM. The STM32H7 errata (ES0445, 2.17.1)
advise resetting an LPTIM through the RCC rather than clearing its
ENABLE bit, which may leave its interrupt stuck and keep the device out
of Stop. Allow a reset.

PebbleOS, whose STM32H747 port uses an LPTIM of each core as its system
timer, describes and uses these resets.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 4eabafb8079d..412060d3f167 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -41,6 +41,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   "#address-cells":
     const: 1
 
-- 
2.45.2

