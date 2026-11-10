Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284660;
	b=lMjfjyVucH2+fUz+Iuj/FD9xEi31gULfKwciUmkLM7WRhDXKez5cnN0WElMgOgG1DUiv
	 8ieb8Idv4dRVXNC9zucooECxMPlH2GFRTgzkcOaP8nkyGlVXDBX+2y0DxBtTCyMbvRs9K
	 cSAS0PzJV9NIgwu190RYVZQPLFq4ZPAd6bJ3RcL2+sGnEvXfltsnTn5cIztxoFsZJayjl
	 MYlyQqV5Qe+4M3sdw8exarZyivlaS0f6aDJwS4sOjqVUjywJqZMDkC457MlbrB7fsBDvR
	 p90Ns4udNQF4Pe4J0hemIAOx/JYn4h2YnpNQZ0nvXlXZ1CZpMdZgptidVt8dDr/cZ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
	b=PvBW6BLnaCvsk0ewbNqn8XVUrpQQWthPmbJnYzonTBy6MNxA/vp1XYoazbNpuFN/VwY3
	 vCPacOSzu4XDa2IUyrAQjgd7MCy15fSp7/O+I+YgX1J2VSnzqkZrQCi5AfcchVuK/ywmR
	 LwHoX6i8dMsioblEfox9toRBnzjuZueep8Y4NnSTNhgMaupxXCDKzOiaKi5KKyB33gVbd
	 olYNZVflj7rgml6QHnLWQAH39afAXc+gJVhU1YD3vzJvIogkQzF/iXBB/T3xmbX5DaKuL
	 XSSyhCeevC9pQP01v4dsOGbOR4xBbBIdW23IxFIbaVlsxWSw2UYX9GD4Yng5OOw0PSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GXCqMYsQ;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD9606BB1D
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 04:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BD9606BB1D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GXCqMYsQ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so2714828c88.0
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 20:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284659; x=1794889459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
        b=GXCqMYsQCp0ZE+ikYqKA3wC8RMNIUztuVHbtEjoIE3zX3ryBD5q9C4vYqPkogqP8JV
         xBmJYBBGkrnHxUoM4BeXhYrQpxiXS/RU1nnGZLqCDt0PSJzDXnScjOV48enURvLWyq9f
         sK8zyYJ50m9qQquItId+4MZK+cOYOCO0KKV1EmXCCckZfqfQZ9sA9J7jqbVRUpdrULh7
         br9G/pF8/Gb6vwJh/NvPwVMBma6gupVd7g/hzyxReihpirUyRXdIF6DDM9SWhU8biqsc
         m+J+rawpMoy/GAAbsyJyU3YBhnPmyC5IhycJZrjkADVzUOQOv85TMsrjxjfDhq6P9j0i
         a7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284659; x=1794889459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
        b=bI67Y27Yjhdng4zs0zExnMKJtsASFSFlCE2TMSATRJF5XeaLH3p+MYo/5KoKcQ2mkj
         oW3T8R+XKrnw7WM0ozXXL2ePRcG7Q3lNuzvwWh5Ex9tUOL4bSTkxYviMK70G14LuxjJ1
         b+bPX6FXs9Oh8ae8fGRCUcehL3rL7XB6HNVx05+mQoiqbuFHJ9aiGulHXciQ8FjmFV7/
         LtSt66N87zSfazaraW2iU2G6YKfpD+eUxGQnutFSN/e3sDoFIMgcICo2d3SQUYB81aOd
         o4njcuiKJd/g6brqkZeLmtsA/txXIAQBpmQxLV5wlLxcsWsvHEihwicWDN25RXRO738k
         pjPg==
X-Forwarded-Encrypted: i=1; AL+hErGrtTd4mxJuJ82Pn/whLzb5C6QLsBUzbAHopugHJg8nS6EeegUEf+8Mt5UWQGXuBLFQAqs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+d3RovSV/HZat7ChLxvkpF9SsmXJ+mOARUSMcvadmacZKvoBpg
	9swO6SxpUvNqtkcB3gwN4UamTepMw3w0Gn+ACY/qvy1ETlt0abf4jFhN+AMksNZmTw==
X-Gm-Gg: AYBFou31Alok9uWGUZYh2RBVOoUFOii4K4lmGkB5MdJoawyduMoPTJz6iJIeVeIaeDt
	10UT9wx2/UiB6IgWlJXbS52qWPBpEAwfaqp4UehUK6euq4a0E/gRSOLQMfN7lFJ+c6c1rc0fKrw
	vQfKueeeB0cqrarINRaGFYdwaCrV37aysbsDfGXC+CDNiKIQ5f/vSaBpJEn9WmVCutoAOfRw5Di
	WYIg6gyTnX7SPqorPRgyG9j/QOhDXxBjriziIeVSMMVGBmkq4qcdZn8ZV5hD/aWG2pRIE045NXC
	HTJl6KcdVHEgZAJKeH4UaQLZ9meiKEe1P5VtSlKOtZcgvmycF0dSMYJ6TfUYyjS8G2gd+IWyDdR
	+WA+KH+PsdCRN+1zQem00L4nsSanpJJZfPlY7sFZAyQpnSe4jXXQkYTXOlmsPb7SnGr+b2DY9Iu
	LFZQUa1Bu8ugY69QUr6Q3eVsJ5jdBjX12/KIJQr630pmWcRRWd+3LPzjD0yau+l2EQk/aEDlhgI
	IFMXwTnAjbxPvJAR+gc2xZfiCoUFSOpmgKEGhA6EFp/Vc6XRt2AvvsoFzR6GHwiZHdqV2dtsW5x
	JN5qYsoLfePLQ+3aN58yRrB0k3ymFbDw8Wsb8eH3AVKtQ2c5o4dsaMvAYQX2zP4uZwDHLSRmard
	5M3V2s0Oz6s6SHYrl
X-Received: by 2002:a05:7022:1505:b0:1b3:ac53:da84 with SMTP id a92af1059eb24-1b3b603ea3cmr2230611c88.32.1794284658677;
        Mon, 09 Nov 2026 20:24:18 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:18 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 1/3] dt-bindings: mfd: syscon: add ti,am654-gtc
Date: Tue, 10 Nov 2026 11:24:01 +0700
Message-ID: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794284248.git.jjc@jclark.com>
References: <cover.1794284248.git.jjc@jclark.com>
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

Add a compatible for the CFG0 register frame of the Global Timebase
Counter (GTC) on TI K3 SoCs. The GTC is the system counter that the Arm
cores read as the architected counter. CFG0 holds GTC_CFG0_PUSHEVT,
which selects the counter bit that the GTC exports as its push event
output; the CPTS driver writes to that register to provide hardware
cross-timestamps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca2..b1030f11b2db 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -131,6 +131,7 @@ properties:
               - ti,am625-dss-oldi-io-ctrl
               - ti,am62p-cpsw-mac-efuse
               - ti,am654-dss-oldi-io-ctrl
+              - ti,am654-gtc
               - ti,j784s4-acspcie-proxy-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
-- 
2.56.0

