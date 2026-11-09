Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214238;
	b=uBbDP/UjqAAdPJZ8jWPzVDTls3x8cOk9PAGbttkImcX82DeH1xYlHa9zyGmJexTSivKc
	 4HmMhJjjI6jfsTOWNau2/B7OpabaigL6mRq/7CZdO3fjV2ZZI+gtRkGflMCTCm/yrGgO4
	 Z6ryxcl789OQ2BO79ahF7gkCaQAoaj8KezKj3AfUZSTCd9gLwJ5Z0TkHcLqfd1JnadQI+
	 PpcDJfaVIu6gg5MNPvsJo/J9YkucaftlnkvuNuSKQ14zIBrHuy2TELt52cQZs5h+llbK4
	 butPBy31CvrQVzvzCpa0YkkpI1JERGdAyoI2rK8ID12DvroVpR5kP0elgSfB66CbB5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
	b=dgcDYNcXdeZHCJ7EIryus/yts9C79iflvuFsybJauBnicWzgTS9bkWqOOC+M0sm1N4Dr
	 jCqQ4X1CbdopUan0Va5m5jX/3wJNMYbYW2zKxanFs/enctsw+CSTpLxppL2ZPFdOn+Jb/
	 pbauxpE9oFeGt/oBqgdpTRFssv/z5Je+K7hMgAXdmgeV8OUMYLTNoL/sC8EGIfeTPAmbH
	 JzU065iDRVv3HW1RM5IA4lrLma5JZQ61Qq3PP3/Yx92+TboTVXWfidqjvPEDnzqQwL9tF
	 ZrkDBRYEG8RKUnLOUnfV5C2F2o4pd9oa7NNi7LDL4Cw7yePmC1OjX+hZ9nEgesKtfFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpAGTtQ8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9497606A337
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 08:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9497606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpAGTtQ8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3788425e9.2
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214236; x=1794819036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=RpAGTtQ8VhddT3RKknymSaauGoGicxY4DpLihs3kKesJVVHpCx4G2bBL2WPGw+s4Gl
         YG6yUWS+lTa8UX5pbeJuq+iYxm3HrOt3JO1gWRIgzruMTUQq/+InVDpATJ7Z8HbYZ0rO
         HPdtfR6l6aMUeNR4lzt8ECrawh1wfvsgsi2nBW2a1s8TUW542V+RADSOwR5trlq6mCIR
         wyVJhG5V8kZFXYg3zhdr2sSpIeWhxeYzhYKukVsjPVEoFEhvD3sA56fKQHWhCW8aGtI9
         LMPSzjyRXaYj9qyYOWHD2lHzDe5reL9zXOvbgKp34G24gTJOfeC9DwpwaAkq70d7YJSs
         R6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214236; x=1794819036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=jhaGXOYO2eRNpH9mwLgyxug8N8wKheHjPJ5OZdvEX6nu8CTbHXcSY/5oicPu4wEaIz
         qFToZaeDDd1Yinj2Bmv6/aTBaekwDyHJBqQ6X7QIEtw89fdVUahlZXduNZRHNIZZKEUe
         WjDkpEegthElw2BVvPHz38Df6oYjZOzt+NUbP7rqpY+4hPp4V856QyhPUGz/52gqWKnC
         bAfhjdUx7WWHZhHgt3lm5MVKz23JwfQgNhi4+NY1kpizkL5WrKnzHkuqoTbICIOH6Gox
         0eXAPfrY5cS6rvOgo8+g9jIeZ5z+ljB/tfAkJl4ktmhIMD+71KBEWaTPUMAAJqjOACs6
         ffMA==
X-Forwarded-Encrypted: i=1; AL+hErGgoA78MGPMn9ZIGOdwJr9vqNRLd2rt643VbkcoeeUX3DDEfT+SXDNriUeMithzRahCFck=@lists.linux.dev
X-Gm-Message-State: APuU4Z/KHk76V39bJ0VEI95AojzUpMCdGSy1mz3OF2C8/S5yhWMM7ZlO
	jGSQZtrOImoCBSyWcOBHQvO2nFAC79e1I2uDnLox/W8SixcwO5opsGD7
X-Gm-Gg: AYBFou0rv685wPuEtGe7KCGXKbEjgv09G9o6Z/y5OM8kVryvxpWTKSH4cTapr/UBCSI
	tytQ6OMz6gAd6OcrirVAzxRCqNMZRwRsDmc7Dcqr/vzHKpeDdPE0TzdckGUO1VpNViz+/GFhZnL
	fyMdR58fBMvIv3Eh+UrF+FkzxFg66JooR+WfGN0sSLmMA7oFnR1zpcNDB81sc8/XbXf9sV6jWNO
	vxGEfuAEaWCsEsrTwOILHkLjFdhoCDD8jZL6/R650/tXOtmqGETsYTEQh4ZZ1bNUkHRK5dZ15kP
	M6Vt+stS0s8Mhp5JcmZJSJYSXc02uUdPTn3X6j7OMRHVKmTrTGBbluRR9jGGEXnSwxuiAjXcBbv
	lr6dzcPTlX0UolepWzmu8kQisJljnhOuVBxwiXCOVcriJc+GIJEFe1u56UKLVZggs1uXCRrvMK2
	dTLleRwrasTt0lLWLXg3JGBppKeeaHneFlpMvMv8aIzKhynNTJevDy5kNC3VV2uI2LvIe8SJiup
	8aR/aje8gvIZaFtJOoflBNq337TJyxnFKqsCYbZYlDcOXmcMZ4LFKt8Naz1vm1AO41PbmEU1kpx
	38F+IgAPxb7Y6Yu6yAmiOwPEolE=
X-Received: by 2002:a05:600c:3b1a:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b963c7e496mr65389125e9.29.1794214235848;
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502d5b1sm147015055e9.5.2026.11.09.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Date: Mon,  9 Nov 2026 08:50:19 +0000
Message-ID: <20261109085019.1751534-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
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

On 09/11/2026 09:29, Krzysztof Kozlowski wrote:
> Odd license, suggests you copied it.
>
> You should retain original copyrights as well.

The license is BSD-3-Clause because I used sm8550.dtsi as the template
for the node layout. The values come from Qualcomm's downstream
anorak.dtsi, which has no license or copyright header. v2 will add the
Linaro copyright from sm8550.dtsi. I'll fix the other comments in v2
too.

Stanislav
