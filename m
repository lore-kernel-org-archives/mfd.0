Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184461;
	b=iFOcriLXTJBVLqqkQ61TRNMbyLmmWVXWtq2fAj84dsff1RshsaVO8ajf3cFRTgOXoOhl
	 2jdt5jw7Uhn571wYh4WdsiXV7we9CzgZjjnBuRM4E01qnUcRhmz9ORvdf5FdK3PzMw5Eg
	 UoGNRyhWsosb87Rh96zX0o1GYNNN1jGKd1lylPGPHz+ZLoIP2RX07cTI9ZedE2/ErGKjy
	 m2KW6h0xqFpoUs3lbjxr1f5ezPULeSD3zZeo2O/ZnoFArJ0fxhNLU44YrQGsUNfTSjXd6
	 uJekR7UZGwhT3H2RBTJXgXs7ykb5dp9lRzvuXbryPf5ry1yRGPUL6XimfwmoGbZ9c9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
	b=si9k1DJoshgx+wfExHV9U7/KyqQyWo4nRYM5Wnd8c7eqV+fKr/6BfhbNIQem4pykZIbK
	 wpMB2CxwWytAIiDdZFXCd5ywaXL9Y6YBMaw03bqZxrPNGyhoU49VRUoDI0kJqxC0to6gp
	 h7nXfug4c8EsvCsazHSBgV/xWF7F2r8oBrHiuElwIEVjuH6TCRgVKrV/0G8CBr+5HBfmF
	 eu6JFHohNYapCQVrJLRO70xLpa3s5kE/2s7127VlSMUT5qQ62Chf0yeNwuaaoCfsX+4yT
	 zbg8TAQnGJtPqZ53PM43PA6OWG9g4lsVUBLL0RfkrflgHFtDC0hJ1LOjQrNnBgROegw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moNWhKiw;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312C6083601
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C312C6083601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moNWhKiw
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490f38e9688so245584f8f.0
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184459; x=1794789259; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=moNWhKiwqhXacD4sp8Ce1qMeeZuh5/9AoLOvk63g2UpAKW7sMQVpeS5lc+atnaHzet
         FPi1JA0xl2fu739HoksfQQI/5WL0NTNeWMA0Y5dGy+z3VpsWcO+0O4wZ6MhUYmxzA369
         xv86PyHSMB2PD3AMT1B5x8RScDcKQm27zgBmmJRaHrOU16ssdaeexod2oTZB1dUPv0FH
         Ti0BCrQy15LbrwOR+Eh/8JojZ6DS9rSPeJ71NqvMH1CZ/+Tv+KxrtxflSLpvyMtlbJy9
         amo/jcl36uhMoVDI6nZORPa7Y9Oki4l8rBG4neh1kIflEZdZj0V3Twt7dYCFQw6pYD4q
         9ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184459; x=1794789259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=VXS2voxxgyVCjZ9OEA2D2Dffq11Gf5BcYLJmtsp7bGkCBog0h9TBCRxZVqitAowjcF
         ltILd8nBu5WuGafskVwEhKAQAeJVfuyJB+emYAruYC8UmGqlgKG/cLXCuAhA4OgqYNT4
         NrkwpJYbdWhBur6oEZ79+SBnv3nyNI56GuK8822O2yFnkfU2UXPKYIRnqci8islUXyRd
         5plgVqJJhSB+C5mm8xyUau6dR/nhjaze7TbiKX6hACG4avikWWeJTcis+84ddTXv9dYh
         Eu4yEXfaJA5IgcRUXx/476cIs3WnpYyVevaanFWHopy/8JT9enjOsmLsXgV62z9RmUc6
         ATPA==
X-Forwarded-Encrypted: i=1; AL+hErEogOu62uhqgZQkLNACB7aymcsqOHrmewavGsNnoRFs6nY8LRfULft3virs51r8g6OpMpk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+dqJICSe/pUGvuOmoqWliTgsDcnNz4NlaFWgWnjVuKuJy0sbE7
	0KvsFyg6cnzVolQnKrf1+9ILUVAog/JMSPNRGA6sZPrB86v/C2vyCA9G
X-Gm-Gg: AYBFou1ibshZKAMhgPfSrr/NOFdAQmeu3Cux5XHDiboK8ZQC7rQzTt7LdvNHCs65fuy
	ddaEgwp4mZJHizEHdyKT8l+eEt+KIzwCfp+kd6KtDvaGFM0i4iNMzBkRZxpi+FJds4azAgMN8R8
	c3BEnr5OSgG2w+bXDGX2+Vw68A+wwRDkxNlL3UF1a9Yad3P5EibAX2/1+BlkJiN6IwjWwCZiiFT
	pBXBqnEJVkyOJE/1ymXb9c4Orn9G/sOVfQ87LxMYcMsdPFRdD+kAG/GOCaQX6HK4X3Ca/yxtdBT
	K+0+Rytxz/nCgVPXwTXrMJ+kq5QIUyQboO3Ss0DbtQ6xJ7aAXfsNppcODDsX4CF7ZaQYuSn45es
	zmSxFfwfxiFYBpcRP0SbJBqYud1Z/38w2b2yxlYvHHZP/SZmeIuLn5ZGXU0ux52whEUqGkTkCRY
	B7DKVc42waI3nOsIYG1CZe0biUABk50BoDvx0+QGG1/hrrysja2Nu9cTR3QxlRd/VUIl8biMdIV
	jr/hfhGOh41ZnFHAU26NFUYmCE3hsEBHvmOHJs2XErv1yF02uYWgIZITAgNYNG8bLGqMjud4qC/
	VIekzdzl+O+j6vB15PC2FSfsIBMVuZPJi3HxRDNs
X-Received: by 2002:a05:6000:2511:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-494248ee013mr10847131f8f.21.1794184459219;
        Sun, 08 Nov 2026 16:34:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:22 +0000
Subject: [PATCH 10/17] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-10-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=whHNXCMkWBlbyRe6Xqxsfmk8vbhGS1Ie1Ck2sCxfwGhqRMBxKE4lbZ1T0XWovH16DltXzjMRT
 ok60qvi/6qNA6DJ9tcvRYuZUzSKXMRRZZv1H2XgMMF2zBm+cXxEQ/SB
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

