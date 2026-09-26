Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D546347D454
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432747; cv=none; b=i9OWyyzoPwTAYOCV/D3nZOrkZLgduKZLtS+KsAI9EovmI5kp+uAY814b8rDx5Fdxl+I2+xJpWe+Y+Lm0pbGacDQIuQml3wbW0mKoj8ZKJmbAzeSZhGQHWkIlddp9LoUVbfH6mChZ24T78hHeFQMQu9hZflD+s0yglLZdMVymChQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432747; c=relaxed/simple;
	bh=sjXsu7Wk9oEJK2CdX+yMd1S1zZaVAPHVkhDsFazZ8Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DF4zuym6eauMI4Tlp7K6Rl5RH12Xs0Qrf0bSOeihL7f+GhTZM7MabjUb0DQho+U9NQUa+biygp51xdE82lHVGYMmSgXaxvMrkEk+aZK6LU4zPvcufs29ORnCq0w73qYzNMv7m1Cx8xt+wz2bLInGZoYy0GxuHfLhsrhu9cSVUq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcLNVUL7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcLNVUL7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso958335e9.3
        for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432741; x=1791037541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y43NkA24svrY78BBtc2WACNWICreOcqz7QrQruDzQ7g=;
        b=YcLNVUL76QJnptr2ogHFf9iw2DnDsPV6tF3jhN4kfDUBLKjtV8yMOTRAVGQaxtUVwo
         BlEzQjCQVF3Nfb4wP06sxOUK/JnOruQZ9AUsGy2l9xviIAbCGAJq+K7iWlz1koit6gU3
         e3X7ZnetZl3huCfdS9sYUs6i8PnyWRjGR5OAo7K8s4BFA4faqoHflDlmU5wiua+pFTdG
         qnGWyF6iXoxOKX7bIl5lGeg2+tIOwqzGFYRtA9wRNsOq7naH/hgJqrCobRvyiTTcm71B
         dfw2oblVfVwwyDedPfFmrCAO3vGS1/nad0BUOCclzHUrrQ/y3ECT1Klv7pDBkt7po1ls
         frGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432741; x=1791037541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y43NkA24svrY78BBtc2WACNWICreOcqz7QrQruDzQ7g=;
        b=yVPSpK7ELEbMz/NJRy5Irz6kOFoM/F1stidZkxXLQbV4fnO0pJJvHPYpeCAgWg+zk3
         MCIjNlcnAFD7A6t3xUWk+QKSlw1b9AdHvnYDj0am7LUdrK3jXH1C9+RPAG5eRal56n8c
         EntrPhD6mxhhJFPlQkUK/TCAl3u1VwSit/Q//WLNGmNLMnHePE8A9rXHBCDXNapOhVgI
         GKtnKmX16VQmRjdpbQK/meJOkSFdkdXniSmeCd+qLFqcz1ZBPgtVzsR9sP8HID2t45sk
         BCvgB71TpL+s6WZefvMc3BIASiW7gYmyIvIRBtkDWbx3UkqJsSYZP/26LBkU1H8Xc/xr
         dxKA==
X-Forwarded-Encrypted: i=1; AKwUvBx6qnyO/Hz/NKfGj3Lgo2FgCEHCJ3leHcppzvPZIdu6cE+RUnJR++7f8alh3TRYU0KlEdo=@lists.linux.dev
X-Gm-Message-State: AFuF++mFfdhMcp24BadPoMBMpaaimZ1SYmNdk/GZqOzRzSgSdjR/6pUt
	MkYFmvWTq++1ILQiqGQ113wb4lgTcY8fM4JVVLv4xFw20bydjwKcbypGuP2oRhiP5Yk=
X-Gm-Gg: AYBFou3zjNx0k/pPWTGyRHwh9U/9CTs2lwhwh6jUu60ZiEdf1LAnWYhd7t7thmNINo5
	FWIo1Dpcvd3I+T4+M4UsenBRdnaJHdeUsfujwS4/7HwEvpTXOeLQ/1RaHohylu45iFWk0T01yM5
	7patD+F8hTI3Ggxt6WSB+dP1HIgb5V5vdZZIrPQAj2PvnCfnmrSX0KujJdMkUSBfC/sSgan/HoK
	dOt29BgoBfy/o/l68+V4+vKiunuIaxxAgeTF11e2EHaJ2H4Z83wuJoLEBHrMTp86+MrKaSkvBsv
	FAGVeDB8oY/B+M1QmmpktJSeuLE5CPxuIcPMIXQGzUvMcX+NvB21aCpwkLwI6SOmB2gldpeIFBx
	q4qle8bHFbiKL/GGr3Z3lwF0mEdcpjgg7D0FWc5kpO3Ta2/dWAK3DTdExHQYtNjHDYFWUB6R2Lg
	VUh/Ui5IkkniZI2XJ7FifUlX9yxg4wKogz+bn+IXECOdlfInjVoxJ6Jm6CPwuqlf/pCBJ1/GQUt
	X/briNHuHs=
X-Received: by 2002:a05:600c:698d:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-49fff32848dmr11092055e9.16.1790432741347;
        Sat, 26 Sep 2026 07:25:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm101995495e9.3.2026.09.26.07.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:25:40 -0700 (PDT)
Message-ID: <10108920-4109-42ab-960b-85bfb4a49a80@linaro.org>
Date: Sat, 26 Sep 2026 15:25:38 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/12] arm64: dts: qcom: pm660: Add USB Type-C port
 controller node
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> Add the PM660 Type-C port controller and PD PHY device node.
> 
> As on PMI8998, the Type-C CC logic is part of the charger's USBIN
> peripheral at 0x1300, the PD PHY is at 0x1700. The node uses the
> 'type-c-change' interrupt from the USBIN peripheral for CC state
> notifications, plus the 8 PD PHY interrupts, including fr-swap.
> 
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
> 
> Assisted-by: LLM
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/pm660.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> index 156b2ddff0dcb..37965a3607417 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -85,16 +85,43 @@ pm660_charger: charger@1000 {
>   
>   			io-channels = <&pm660_rradc 3>,
>   				      <&pm660_rradc 4>;
>   			io-channel-names = "usbin_i", "usbin_v";
>   
>   			status = "disabled";
>   		};
>   
> +		pm660_typec: typec@1300 {
> +			compatible = "qcom,pm660-typec";
> +			reg = <0x1300>,
> +			      <0x1700>;
> +
> +			interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "type-c-change",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +
> +			status = "disabled";
> +		};
> +
>   		pm660_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
>   			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
>   			io-channels = <&pm660_adc ADC5_DIE_TEMP>;
>   			io-channel-names = "thermal";
>   			#thermal-sensor-cells = <0>;
>   		};
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
