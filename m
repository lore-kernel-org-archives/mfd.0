Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F4E448384
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432905; cv=none; b=esdV4NWtfzApWB8/MaE3LMeqqZCL/SZNnMo7hS0DPAE3WX6UNV6dm6KuYD0mXz1YsLAhSIQd1rY/KhNF6uenJ/YN8eAG+ItrnhfVt0+eavTal8n8GONb4Qwvf1Wzy6F/zx0eo8ZNiatog8FXrE3Djo5nswgzssokDpTUF7rNrV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432905; c=relaxed/simple;
	bh=7vUh66oXceOvBZh+BHUwEREpPut071+FDoigXD4wyck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUkLi+nE15U/7/pqqEFoimtMGH6QhjcBcxGhXX2f4lVmmH9+4wHKBE6YERalHmFwA0V/UcYT/+6CoJPMHnhyYzHRVaKpiH9U1ArHwZrwuk6bWEQU4pP5tBAXu87irSGgFJgLiPDBMh9zLixcRsbS28469myRM7nEkROjCux/nhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cSeDcKwe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cSeDcKwe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so9992185e9.1
        for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432902; x=1791037702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRyn178SjOYN2ExubyMZSe0BAzVjg4ClqLKh84+ypJ8=;
        b=cSeDcKwezgKwsHG8JJkwttwUabdUi2Pk5pEH+pBA+2KclJWkRPFz8+/BtuLhOhmGaJ
         ef8TzczVN6jscgxFJ1o7LS3Myt/7te+fRoYM2uySI1CElLDUhzqGNkgDQFji7Ts7eWFX
         HywCpXIuEFFv2dmEgjdHqUrmekIl9GuvigXGCLYMmTApqM89MJb8BfaTE5nhGov95rWQ
         MefW52TP6+GWhxLFcaJ+KU1xOGdQwAcODmQdXUY2zzlNZGjwtJ/o59Xi8h3CkSM6PKE+
         z8xvdEZkiiARLBu2aLW4d+SX2RsBs734caB/uNXzfKQ0vAGK2B8Wl9HOUoKGYHLQd11X
         mnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432902; x=1791037702;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRyn178SjOYN2ExubyMZSe0BAzVjg4ClqLKh84+ypJ8=;
        b=UsjzwqspxIt2gBg8NVy1K+8huGGfgNjw1fOj7Lqhq+bnZa0ic+SogOXyNRBtmPgiRR
         +YwYIqQbkN8P1aumV34brHqIxnEO6OHNB70fhQecvispSrpU+EgLKSMhKyQhl80AuIRn
         jaCWWIITZnGWR010AD5R7tLF2bITAK64WoT1bn1puaFxnVQm9JMd6Q+B3r2HcUH3i50+
         mRa+Mq2Z9s4sbFMDDmzzTymKQ6qx7c7n5zhtTY/RnjCN2zzPWuV4LBsZgnXiuSysTtU/
         +Uba1tCS/LaXyN8P9t+0ky9aMAfQakXBnge84/fbUDVOcFiOnMEJjuIwzw8o4HQW5Sfh
         nNRw==
X-Forwarded-Encrypted: i=1; AKwUvByIuwvjy7nyuBE6a5inHXzTo6fKP1r4jTfTMRtvrgJEZeVipZy3anPH/i/lO4THzanA6P4=@lists.linux.dev
X-Gm-Message-State: AFuF++nyDRvTgIXX3QTBdOIzN/HJo/ZBy9neuHurdga67Rl6+dH27RKa
	8Nbrkchk9zJ8DukzCnsyo9feH0PJadUlx7nyRXPfrd+W/+dNQu/VTe/21och/zkCMh0=
X-Gm-Gg: AYBFou3WVsm2K+5blDpE23P97g5ssF1xDl9GzGqMY7LvwmVz3+w4OML8/HwW5gyc5fd
	7ge7pKcyvF17uWs1IdnQ9bVpSX0dHJ8RwFUmVRwWKzHGCRlC/HjEh41QaSdG5wnHte5bqUkYLNO
	RjF/q/jTsMAc0gpAK01HVmunrrPIWop3uyX9EJC0BNsd32VgdPStRuh+0vYcZrsxc5coJd52oAe
	wm0m68LnCA/W+/mlu9bsFSJTEDYgZxDe/jdBAHuccEG7qDbS9GK9AzWeH4bGvXNycTr7L14Es6U
	3MMxQ+c0vwmClDTSTd7s4Z6h4I/qBFqptJnwvLG3RK8HT4t18Z/vHe4NexJeSsVkWs1iYM0wGko
	EWQUzx4q1sW41Du2MZW7BKOCxck7jAveB5OpP3zM4siekxAXB3pJvJBpXaUwnHvK6RQ+kyuJeUH
	rH1YT59Rw9YfNkMPsiIirT0ndCgxxKgsbfp1NkkakcMPmj127D28+U8zmuICuLy5GFxSpxpr/Sk
	G/z3EWw0DlxMAYeaFH8Rg==
X-Received: by 2002:a05:600c:4f12:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-49fe6700d0cmr169059275e9.28.1790432902328;
        Sat, 26 Sep 2026 07:28:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4271sm320463865e9.5.2026.09.26.07.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:28:21 -0700 (PDT)
Message-ID: <d2a29116-967b-4ca1-a6de-510d68afec0b@linaro.org>
Date: Sat, 26 Sep 2026 15:28:20 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/12] arm64: dts: qcom: pmi8998: Add USB Type-C port
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
 <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add the pmi8998 Type-C port controller and PD PHY device node.
> 
> The Type-C CC logic is at USBIN base 0x1300 and the PD PHY is at 0x1700.
> The node uses the 'type-c-change' interrupt from the USBIN peripheral
> for CC state notifications, plus the 8 PD PHY interrupts, including
> fr-swap.
> 
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/pmi8998.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index cd3f0790fd420..878e577c667d0 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -24,16 +24,43 @@ pmi8998_charger: charger@1000 {
>   
>   			io-channels = <&pmi8998_rradc 3>,
>   				      <&pmi8998_rradc 4>;
>   			io-channel-names = "usbin_i", "usbin_v";
>   
>   			status = "disabled";
>   		};
>   
> +		pmi8998_typec: typec@1300 {
> +			compatible = "qcom,pmi8998-typec";
> +			reg = <0x1300>,
> +			      <0x1700>;
> +
> +			interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

