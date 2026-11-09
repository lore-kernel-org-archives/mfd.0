Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184422;
	b=QLm2K/YAHMabHMnd5VBvUrem/ijUuzh1pYyQ5x4VNNY3bwcgIbnFT7OvpQqOl06rHfmQ
	 FW2KmumxJQgcN2EV6hRtYTMrZqmVlB2yNn8kncA3IwwsyjhKy+Uj8zprZhSfCshF78j7Y
	 t+y1DkBY0lGTyFsIOl/4V33ra/Zgv4FU7VaqQwazOkgH8DnIMIyyelQjInO2uqldOJTMK
	 pSQveIb7Elts94I46sqo3muRY/6Wc0g2wHWgqFPtJJnOZuswUas2QJH24sEGnUGPI9RAJ
	 3i+lPQvy8UunTOTF3Usg0ngtYq7B9Cr7mbXyA2Zt/7EN3qo9zYLs/wyiol8Snta9M4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
	b=nWJUW4zhCFXl1jJwoWQ8b4cx7dvxI8xR1CWbuoJG9833ufwzZzAPGOetsE+4TDE6AQbC
	 i2zRDp/TN/Tb9EZMwvBIMW0+yv+ofoXScKPOFyNNJv6787VkeXp0VuzzFQD2WRGkEIi0N
	 prUdTgbbh5r2838LNQuthDD+sEe+FTWZXYCJ6AKgkQO37OVZkKCVgUzU6I8QEv5a5OfQz
	 9J9B7kJ6auwKMi7IBGMMR3eVnrYj2RAvOxt9Olxeo/Pcw7lF9lL8qxpPa3SXRkzgsfBYK
	 CXkdkl7Vj09Lx3WbsBo8a7ZdEMk38y/VTRhxwQLkrzdAN1eJqDPBtNQZGiOG2vxTsNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0kaQ33J;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7572606A326
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7572606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0kaQ33J
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso3338025e9.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184420; x=1794789220; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=J0kaQ33JrVc+eUlPVvfXfH5yjpwTeXd8VyKf/bnh9XcP25Xn98/IXRz0DQKNH1ehA/
         o8qksSGq31xOFCyqA9JWf8PQKsSXdd9HlheEOkh1vJcFTFRt39E2axeUUBjKhdl6GzVa
         9sySmOqTl+TtV6aFGB69eJaUiHCA2HwLr2Ky+bMCKlr7E31djeWc0zwwAAVg5jaKlnN0
         YCv8oHAiQ35RPUeWAoqWw7TzbBfhFhsTmdWM1MP7bakQdDOc+kptUBMPZE6QOY2/dbvz
         xzPR989oDeun0k+VAE6ztRv7Vk0H+fdzpGSuqTXOtu59re/VYzp492vUFIPTV3S4Hs/C
         Z/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184420; x=1794789220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=ob6p6GE0gW+iwQhZtFeK+MacIsxTaK7iBQMMbtRUmiI7Zr2d3mZqDSdBNlFw+pEOLc
         +/u3cZbQtwHKZlRIOtpXMTEY2tS5XXTC1sTwQVKxYGOqCRp6JeMMx3dUXzwHKpIjSaZr
         wwjNw63F8NaHaHeiR0fF8G1ZAIpgJweIT9WbHsPzg8WBOONJoaYpo5tTwM88f36mdwK4
         9uYvhTaX489y3cqAfsC1jpPGb8n3fY9y2eFE07x33hkqjGtQo9MJyQnq9E2jPgQfYeq9
         t+DwQAZy7rgVWnWvfLfQ50NObU8kV9BlbqVG4U4xeESkItsrg4ac7/7H3bh4walj5Kvs
         2Mdg==
X-Forwarded-Encrypted: i=1; AL+hErH4zLrdb1pzfteKLq/TpS1XZutsO2UHm5mCmm3zxSvk39oWOS6p7QmdJKlQ2JR9TbhUx3Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z+PeMCuXyanotCMxjHXMt9+d/AYrepK1Znl5zcK4i8RPHovcBPy
	jLJzh3RXsPld9g+hWYFlB57ZOmLiafX1woNUgU3s75R5zxgkH3/IvaCQ
X-Gm-Gg: AYBFou1kiui+u35ht4jL0Mq14f5D1RLph++3zBbvimLWWq6aWM918swTW5WAVTzkgUW
	3XzvhgKBZvjI3Ei453FPwzmCXvSglRhClIrOnxgp3cknuwTowQvhgZh8koRFi2F3yI4/h5FkWP/
	ojPnYq+JN+gyKCadtgXSPVpbIhaEcOEIeMruzHe0l35C1FkRci2QB3YtHJ/M1G4rbWWr84468Ok
	GslUxTMRncTP6J7PPLI/3urb12u3xLar//a2ps+mr5LPamc3iHDezoYt7oo8OU5qhoOweIAmU4h
	GzSt00pTbLYw9Xlit/+jBOF2Utv1/ICImUlPpxuADZukTnHYXntsQaSVMrOvzl2UIWPMyZguvQl
	SBTQ4toTPmYptcKR1fcJHws+KdlmNSU+nlQ0XMn7vLNuybAmCTV9Ob/d5JO7pyKh9PLFEnBKFyx
	xQn8j9q1vX6LUtIQ+58ivWnZcsiBWqP2bOyp0MSq+2UYajzTZi0vlAC5CpZYVDuSWPsbFGsQi+5
	zLhNS779ivKO7lfglXzpUXdnyxrk35DK+97yrqf8u9YITe8T4AJ5fFY1OX8ePM0VULvfo3goGOe
	s9PY4GqsdHirjRaZqjsDxRoKI9DglKz1Ypc78fLK1hSDwnIF+fjgUOvVL5a5Zg==
X-Received: by 2002:a05:600c:5253:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4b94d762eb6mr47593435e9.3.1794184420329;
        Sun, 08 Nov 2026 16:33:40 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:15 +0000
Subject: [PATCH 03/17] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
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
Message-Id: <20261109-halliday-dts-v1-3-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=840;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=4hUtXzlXhIrBYYJFfDKQPQ3vEIzggE85cdjdS9WjQ78=;
 b=/Hr74fQlfTdpftwl6fj+vsUmb0ZD+laYeVxlhFK0akfSM/Zr+bIuUmQJNpniQW71Vw0S+OnBe
 X7HjWxQRJOhA4SO/MxeQgQ2JNwAjEDgqTYH/3IGyH4DzNXVVHXtyQib
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..cf20041e86c8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,halliday-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,kuno-pdc

-- 
2.55.0

