Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184454;
	b=NzShb2cW7J5vVk4vZ1W+NJ7mDPLdbXvUfwLabZ59PRoAc4ffOiyR2205LRf7c9vdb9tj
	 dly5CLP0n+it6zomk+JAR8WnBiBGNJK8X752hxC6caBqlGcH9M3RC5ghtWbpw6+jDKtkF
	 izEDc9Qj+u2F0j2xnZqbJIh6mwzVCgxuDQiNtnBG2uEJz8DJzWC1YJIcJUcJWoDV0Wtm/
	 9LqrEo77koI0g2Y1r4Dcz9ZFb7nFZyunKShC2HSsFLEt2Czw2YNYhAp0xMEZUVVNoqZxQ
	 ssAvndIgCTE+WFtDxuGU6g8Zl7/6wO75A7TuVLngFlceLCNhBvMraoHIToGO4r5NpNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
	b=fzOjqtPr5G/AsQP+mVkq344jluxsz3MtqWRSH/gL2nLG8hjOgHlJRY+6alj0zEE5/aF9
	 Ni3WQa6ycoM0c31Qu5VmYd58oA0tTOcd0Kj24ux5cxHMNj7uxh+frXkAn4cm6KJr6ckUi
	 GT+QWGIlMgRU+9Y9nEG8A3ZHKz0F04rplwcvAU6NjK1r8hijg+Trit+lzH0ozMWFVb3Ds
	 ruvHzFxFIG9K6ozJVNgZ4mhA5WG+HlVm1rXenfP4BXASa2BfvWe7JQ4l1fQFNsf39KGK0
	 OZwhTl7K0GQ5i9I+du/gNX8XnpDNOSLJcX/tgEem4V1qXe5MbvdLSQvWA+KGrzthE4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEq9HtNB;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4D6082BDB
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F4D6082BDB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEq9HtNB
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49134c8509fso284717f8f.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184453; x=1794789253; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=KEq9HtNB5Ujed6V1HOpK+EDHPZDn9L/VcVnVVY+E9FEDWwSE4x+LwPKGztmCRGAtUr
         UfEe2QDQJvjskh+JgX0rjnvBgCoZUmqj1NGFXg2/Qc94AVDhgfQxQrpAKWFR/D4LPmmo
         g4XPVdrDqdOZKfJ/Hroqm3tOHJcTU0GBbT8obpU8t6cq5sSJ0Wo/0FZCCnKzcblFDuRc
         mpqu1y1c15I6my76PvmhHxuaA41t2rmKvvwSl+lue/OUCpo2r7GLhjgwMvId7z1fbVyH
         gVLB+4DDkgkq3uGqKxgxdVvbps0FV3tx2xgT/YNfNKxNxu0t3kPp0vMPvuSvO2KpZ8lR
         XawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184453; x=1794789253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=pHeIPEN7Of0BEPbMy8L6Gmxdj+PALzTzK1kspZFMXVt9o9UlsP2vPOaaffXhSKkHgD
         KVclNNzVfyMqP9qXAdCojYcsn6/KBSrja3V1ssud+AuagEuOrRCbT1rif+xpHu43o4bu
         TEGbJCYQE33iXGbrHpNtaZRCO3GmpLfrhLvmwoEHJukNp/4NBfWnAwT8g52yA6eulP8f
         D0RyQiRHvd36A/9IBHoHrDLEqzsSr49xh7nksYcCTkgKQysL/Limht/hXusu73Jj22dS
         LCHVbtYqKiacNq6z10pOQG6v/uVnude5TLxis4wzRgp310+T6GUfdEd0OwBLSuM3C19V
         2V7g==
X-Forwarded-Encrypted: i=1; AL+hErHY47H0mr33MU+yxye14qefrxNM6krw62D8lvFtq4PFc5SNxGvM/zbQT6vLp30zYtqWOlM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9oegF7oYs49iyuLAzRsrWj5j8yirlbPWo2sKvNTupz884QzBAw
	0AQHZ/Kj+fO3O1pPOtheG68Dak36Nx6qQGjM2W06Et3hK+7FK+bkE6ih
X-Gm-Gg: AYBFou0W2oWfqzt8oZO6csdtXl1+qt6boUgNn4oUTIB9hm/CLpPrnsfkNW/VNBwrrN3
	kxBdAiOelLFfLvmwgeWWXCn6uf9RcMbbLTV4PB/XIlXL6dnjeWPYLiNO1TLW1ajmUOtv6m0NDal
	G5O5yEQNYWdNC2Sa5tOe4uAwN+IadgglU/4JqEVdWwo4CnXGR3DM741FnmeHak2HilTKfVdMscU
	KdhzYjAtS6zPmTyPM0XGW2m4Nx/rIJ7WCT8Ahi6POBY60nDW05e/GLH7CfAn+svsh6bUXwJ0WSs
	TFDmrCY6XK1818TKtBgoDvNCbww4dUU9dNZKIwTS6fZewbVTKJVfUf3O5oGToa/BuPQS8C3Sai2
	s0LFaEnXsLxpngAnEWKxyfb16rTjqqS3crNsPA0ekqMbmYH/cziIZlgHj4jCW8yH0CQ2PTewaLp
	oKm//SFCelGB8/rLYorpk80ZwVURhmuDlSXauTHhCLXxukf13VM0RZHjYT54oZGe/6QChzBAUcx
	WkIZdfKEGxQlHZRKKINjG8dAt5P7tysm7GZVkI8EYfxqDLO4i6uWpL2YaduE/EnkQqq1QR4GMvD
	3nrkHPYHUGNvSrsCS/2sBz1VivlTyojyZ6TfFY/T
X-Received: by 2002:a05:6000:40db:b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-49585ca3e5dmr5109174f8f.52.1794184452788;
        Sun, 08 Nov 2026 16:34:12 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:11 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:21 +0000
Subject: [PATCH 09/17] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
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
Message-Id: <20261109-halliday-dts-v1-9-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1028;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=e5+pG0dDXEqC2bp77Ez+oDydvwUzWtL2BPwcLeGQJvE=;
 b=iWkySt37dA02PFmmfguFJEKrCwxdhGzWk24XOJRJESzAH3T4aPp1n4WJJawTbnHxhzVp2Ej2x
 6zP4CwoB/ABAxTrRpUZjqAEi2nTiW6DG09fAo8ednu84TwNnmQyJB1n
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the UFS host controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0

