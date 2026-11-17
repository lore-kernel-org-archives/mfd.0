Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933711;
	b=qEDL5tC3w6DLuKKpFKmelb/np41TYe5I81QhEr+TyseSkCYbGeemf566safWT9+ViZg1
	 y4eVolHHZanr1x1ImPMXcKDS5VrEudLDQ11aU0mmG6zj1svAkA8ZdPkJV8RQwzR3y3k3x
	 NRZbtsoWSQRKWN4Ha+YREj1QXy7GgNVI9R/ervU2zOEJV812VTgjXXsGa8YcOPtEooh4N
	 yldKmyqq6zmmCIjnUmppHp474tWgSRVcTSfXwnApjyHv84BG8wAgxrN0pwWSvAbQsIQen
	 FgPpJiRseDOsUtNgRxN44KecnKWcQvUmmCJeYxsVWZcM5sY9gAQq5ZoJTmCtCecytGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
	b=owPBzZsAEmNc7qVaK/7u/7x7HQ5g4nEWA16YHmCxI6ZjqjetMj7GqAxSOeHEAN/wM79R
	 S/SRVP3NP3Z8aDhOIiFHreHa6pj7KPbnEJCVc1F+cassSAj6CBhrHLygFLkmVfA6FyuCw
	 cZjyg0DxElAlxPXA/bZ46ihOWtAq6RkhQ0w4UTXbCZ8XkNKUn46YUcvw2eHFuVnSBO4Ht
	 vr5Sgn11lfH0iXIT1xqzMOKf2QxyYh8bGX9lM/cw8VcGAsEkYDZ3PgxCLdX4vMDzRuyuy
	 lYirWDVfTED87zi5OiUsNxz7kchqLcfb22yDaku7naGDjhd7E9HxC6V/NrJRWJOB5rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hyd9Axht;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81096606A334
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 16:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81096606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hyd9Axht
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so8645705e9.0
        for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933710; x=1795538510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
        b=hyd9AxhtQDNE3hzl2PbiiEu1Cr8xQAoPjpIQPo/McImZfUAn9RdoOji3Qvp555HWNh
         tPuSJqqqbK7it3Av3eNyk4z+S8K8CK0fRqmvB405hWy1oWGb1G0Gp6K5/9XZvVb9wMKO
         gAeym2/hE8UpQTlBkT8WJW9b2yTPxdf51iLEqLwizP4Y5+b5K4JL06l9qYvQXD4f5+Pa
         6TTiRMi/xkorKGMDiFbRe+6dl63g0wW7AMiR0kWuemPKjSbulVft0K2e+sy/5uaHUtx+
         hHyzAETFEgOBI0Eaw9/Cm3Uh2vrOippXyIkAjDykJph/skIwlm4gvdjAUQ6hlX5QaaW3
         RiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933710; x=1795538510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
        b=Vov19xug1jfwqFTs44GKYWiFvrr2/arz0Tq1p6fcdEhzbIGIi+SKwq3qr5UKiOMLCm
         OXk1CAq+4oT+S0/DqBFzcFB0HdYey0hQMCgxo9cJtT/RFSMyryxlpITk9u7gy3K5n5lI
         5UV+VNdOH35WAynvEDIRBTmo63HB2MBskC+jt8JCS4H9gEU+DepmktxlATKu7Ho+30dv
         WLLfa4ZPS/El/I7bnPyGzgwhPPAZ3gVOWjmlQ+v6E0o3qFYs00/+6S60M5fC36qdWIoD
         1BU0K7/Z5DfjqK4ummfZtfPDQraT5iUWO8IoB0baw2kCIDgJGEAg1GIyVsfK5ZE8xost
         OeDg==
X-Forwarded-Encrypted: i=1; AL+hErEwep6Iw11eCNV/rJT5EnzH6i8A05S1Zi3UpbnQlKtubovUIokBnz8+H9lULLtCayLQhRY=@lists.linux.dev
X-Gm-Message-State: APuU4Z89cqCgEZvQ6N7sGs+WDHliMnrGCEHc9VHa1dvlRZSvmB+Zgvu2
	DoWu6j8ObCx3+b4uL6irdSRrsymKl3d0TeqbX98NjuS3+Ugy9/KS5IqDLQ5yVA==
X-Gm-Gg: AYBFou2zWa8swOaXpKBZTQAhQYQSByVIvoDwzBHLC8lctV5FMUT/jHjd2WAi6+40nO2
	M/L1g2XYkJw04wh/9gh78Z9DdX2qzwcTZAbUth1lWmUbm0ttKTWP76zVZ1JV6xtuiodV1OSqtnH
	2IMXsrne0eP5hcHBQxo116Cz83Y/9EI9S22aP91r5NRlxvAX7qvz1NtdNxUrLF55c/QX+/iQZ4F
	v0n5vvI91B2GZ41qtg5qFWtmB4Fee0OvoLDeq7vi2E1Wi3veL74m2lWZpic5Xsseu1HuBGtlNl8
	tcbyYCFN79nhNOLZgKYRqDckRxcHK4WQWFEqOdK6xoygLc12xEKvROtOiRxLnli/75WiNpdPsEI
	W8ER65csQ+J0x+xLOYB5SlIJBiF6IqeNTlziDspPFpTRNPtLFuJZ01aH9LZVO41YcYtx8T5BZ7L
	wwa05t0gSzY2q7M1T0HanaiotsYLGOkegFQqHmmDX7PcZ1PQ4zErz7Two9scYFYFHJVTrTMhlPQ
	evQ/q+tTHs4KpLxPKfmOa/H+VQVPs7ecjuvtaYIRY5dCaeyVSllEyHvJ8g0Q48Lpc/W1iqk+GR/
	ct5uomRWvyev2tWrgGSOK79TNH2sZDBVJG3Q54K/12Hnl+HSuY3HM/ZxDlk+J/yANtdgUnbNhHM
	y6y5GRmEBKX8L8j5Hf4wQVV9kD+KiiKzvEYBOd+uai8nFM5cbcaPRtjs=
X-Received: by 2002:a05:600c:4584:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb7837a4b9mr69213875e9.7.1794933709681;
        Tue, 17 Nov 2026 08:41:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] an8855: add MFD driver
Date: Tue, 17 Nov 2026 17:41:27 +0100
Message-ID: <20261117164132.47167-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This micro series is the AN8855 MFD driver that can go
parallel to the DSA driver.

Changes v3:
- Rebase on top of linux-next
- Reintroduce switch part
- Add already reviwed switch and phy part
- Use fwnode API
- Use __free for mdio_np
- Use capital letter for node
- Reorder header list
- Use ret directly instead of ret < 0 ...
- Use macro for u32 shift
- Use full 100 column char
- Use unique ddata instead of nested one

Changes v2:
- Rebase on top of linux-next
- Drop switch part from DT patch

Christian Marangi (4):
  dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
  dt-bindings: net: Document support for AN8855 Switch Internal PHY
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++
 .../bindings/net/airoha,an8855-phy.yaml       |  83 +++
 .../net/dsa/airoha,an8855-switch.yaml         |  86 +++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 568 ++++++++++++++++++
 6 files changed, 928 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

