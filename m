Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184431;
	b=LGoUpO1xax6kExMF2EcBnAKa/Y4sJtgdz//E7ewhYWF2KwHyNakv6W3848WgkUUu0CdJ
	 BjsZulgCm7GM/HsRStMGGhrVdHB2OQVMXzMRpdoXboiObSOgb/11Pm/UJKOci/BMKikak
	 kJ6xQ6saixrjN3spwqWrYKjlNC7WTs+uEMqSRVqxeIUnZFJOJBnezKku6Z/CK4fxeoGVb
	 eDoV1/Xb0S9QEhNe+stPO/WWqsgrBUB9rI2PONWXmMr+zruaDK8q9j+w+82F38Xy7GnQK
	 XCqJdH90rJWF6krTi/rTuI5XvsJXTCuxoelQzrUeGe59ULgw5F3KE566wUvqP9paUQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=M0BkdoitDvsu31GVXatyEonRbnpoeMhHE18zrg/i9AK9kQe7OkwbPRERRC2H2M73g47e
	 GSYEtPHCbYTNfd/gnVogogEa+yxXHAPaoQmM3n8pyGTz6b1nE2ZtQIYRBFClHr3WviyCS
	 XrOa6nRf+MZUEnJaydZ8zvbzeedlOk3LtpZIV0fJOFzwFzUoIG9b4f4r2lF4u3Iqm6HpS
	 fsak6nCBPn25su/u8gu8XOhX1m9BtFddteJDQG5TbDA/NPVf15TtP4BZefgYreUXLndYS
	 2ibqTZwx/s4foO8uSL8SpNCmGDRBcGPgSoEKQdRfnBGEARbe8YFZ2zsIkVZ+f6wDGrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPgHnr20;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A8C606D81D
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A8C606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPgHnr20
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2793055e9.0
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184430; x=1794789230; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=aPgHnr20A8mvcR6Enoud3cKU+FtjKqLiHQhjo44ZfFCfFlKa/5r+dMa+vbDWqtZffu
         pyH8ItsI1Z3WzKHFwQv317eQD7+2hOL/S40Uukk1zjekRZS3ISFRcGqKzmV/lKQmkoE5
         TDy+1by5FKbRtwc+Lk1uR8yTIWy4kHxi7aZtnN3SeICP+StyzuIDO+3fyo2bbjpSrhYA
         LjbFQu3kqam5U0olgs6fu5hLGPuhG1zfKrhdiDr7PrCBGd6XGgfVU1fmhPkftpf37pj0
         v576eNgHXN+IR2d5qCIrO9WXpoJj3CAf7J/UCjxvOddnoQF1jhdg4FLJeZtC1pYSY5Oy
         Cobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184430; x=1794789230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=J4ATjzOTCpFKVnxFDULZqEoUCL+RFatBd3kG88VeS0dgma20Boj6D1PMy+XvEtu3IG
         wk2N0F+h+qVLlybtYT8PDXZiJvNG7MUj0wTf23hBI6F5tJqC2eSbYNegh3lUOKpwT43w
         QeGvHTwRwcdE5QfsMpt3ol2RU9z+PvoQSWkK7yfGBCt9WPtq5t/j3M9knUzqswfXVN4p
         082dPdFGdpgwCB87DdfTROwV8LRutxIRwMwo1eqpLNfJ9Or+P2+Xj5JyAm/WzJfbYwso
         9QSWnTkxK8hKYDRY/4WpNfpYTx2F0zu4bucGL7dIDPa4eSDF7fNBQcCn5PphoRCoW91T
         qdMw==
X-Forwarded-Encrypted: i=1; AL+hErGrpzC39XsLGsikYPSHKs86+MtL9i4Xaahs+/qFOmuCi7uPMihto3rQFwADE7wf8n9n8jk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZbEAHEiKlEmluvDUn9p/L5j1HoeOughvnjYD9WzyQhlBjc82+
	aBVYu7yhJVp7Thg0Y4A6uQ6AorpOWtJ4NiwYFtoRJbIQwzzTW9cS4LdU
X-Gm-Gg: AYBFou3JApAlJeqKq+H+I7Mq98I+CN8VP0GRIBnf33A/AH0ul90a3mDlvvCl5osdyRT
	T1xphK/Sn3jc6KmdGhIhHswz0Yq1ZyvyvvqbSVhE66Mamp6vGoB3jDsamFB046JXJjIRg9cO97m
	+3PoDA+a0vbhR6FVmKuGcHXc9IgGSXSUHkDeMnHw+Q2lsRdcQklzxKO1jPA2K0i5xROPzxTL8N7
	nSiggM7X4Cpbze66eUMz34NZK2KPRWCp0TN4kXY3WgDNRSYRm8U242Z17dS4jod9WBscZFoQbF1
	x2DXIWglbA4kHNxieZX7k2wXxBd4z9iHToiSAx1ByPw9j6fDyNa7QYCpZNGvgr284o21422BwwV
	/1f+pCJgFyVuUss25XphMDniubiOffD5HS+bUziijIC1HT3CQRZiM/757+3MIztaR78dpjt2qZO
	RfXeFn4JvBpbaSjopRjIsOGzY5Ecuha3u/g2iTH/RU+8WstV5qCBNBufRh+8xNsgWoY9T3DNUZv
	ehpfvIG9/tvXn6t/jWybYaZtnuk7znksOwK25Xnev02b1uue3jcg/jHSLPG9n4TAP0yy65UBQ0k
	k8LNmqSF9PcjgThsdg3zwFx0jR4XkKtVoujZWBfm
X-Received: by 2002:a7b:c34c:0:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4b8205a7b74mr74612065e9.18.1794184430004;
        Sun, 08 Nov 2026 16:33:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:17 +0000
Subject: [PATCH 05/17] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
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
Message-Id: <20261109-halliday-dts-v1-5-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=uUjeKsqz31kCcfPZSa8Z47M4B7r1CADYAoSad8joeZDRvAbLwLDkhf9ZDymLvxVoerAVE+UqI
 g/farVtv7C7AYkuFx6U6v9lz+2+4yx0RS/OmA8jjU0ljraJ4I1qJLhy
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0

