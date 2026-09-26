Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590142DA3D
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429697; cv=none; b=FjwSKRWtIi1zWg87rV/A/L/XSsjX6KhrE6VEQ3K6ds84u5Tzn9sKpL+TlhmUV2V25aTC37AR62N9qTU/Ap8NiCoHO2IbEUm6z2Ic1tqP8eJ+4AebMGeS1GZ90ZWd+jLi6ph07YkYA5ITxhVpR8b03GKqOcZLiTpcj/C/R9x17wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429697; c=relaxed/simple;
	bh=3CWJLlofZQApttlhq+kpMHCeVeEF0wllP78y3q08F/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL6aQUqUgp6a2Y7Mx0tT9r23L36eVBtHOADdaSOPZBSGzIxFKmaKaTuma+ad31y1o5JHqcAN7ZUbokRJ5go9RyeNIL0ABgLi5rNuQotHpTl5vfSKlb1jOOE5bytyNFDG7MXBmzfOuON1ppRpHx1wQwHZe1OLj+UEL9ldjcJIb04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PLdrnMr0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PLdrnMr0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1052917f8f.3
        for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790429693; x=1791034493; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfnxRYVPxR6v6awtj9prtQ+scY/SGqS6pi8ulBW0ptg=;
        b=PLdrnMr0an/lKjmte1nNfrh0GvSz93meszd4U/WfoDEv4NAPoe3kBrsq71wnc14jGI
         7PgISdhaiZUfiCAcrmo5tekTsIQ42RN8hbYxskzLpne4EuQ8F88dTC/Wk5Ji3KgTUXrR
         u+GNmjhRqJsmcmCwEREJngEKT6W5NUAo2tzE3CGOiQIb3NP94NLMdsdlbfhJ26cP1Evb
         nMYMH1Sha1wGjy2l0g6Lbe2KNjV/vqtNde11A5D3oWrK4qrWkqqEnJIX+Ajw5DhXUspD
         gUrnV8whTyouH43RPBp1iNi1ZTWS9jW/FxVCpbj3Gbh3RdVL/GABOEs6zFb8Sb/tDDjV
         Fzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429693; x=1791034493;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfnxRYVPxR6v6awtj9prtQ+scY/SGqS6pi8ulBW0ptg=;
        b=B4DYiKHmbssPz2Cjq0ZNVDMJtuMnkovrvItbK07Lejyc3f+OaxPfQ7o7JKhBV+o2qN
         lSlEyq4WE6aAHKJfGVBI7rr8Yi/dPyIA2QKbmxR7Pctx/1JOU+eiVx/P0NNtyE/Zp1rB
         KW7oJVVx3pYsagOiVl3RYrDlMSBbITXmVYqW5tZECjJuDTPu+vV/oXh3NbqW4PIorpvn
         v6kAz56qkpokDs4zIGytyhtoUMhm40VNtIYcVWMyEuU9iFMIfKHHIyC2EDL5wUyXVMdh
         ZiIXs5fTcmShdstvdP8DFyUkGcVqPHsp2OQ31EwoNSbj3a5KkySmxUUuu5zyf/Pg0I2V
         P5AQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/3K/nr9gDk+323VM3kNXbiDPwIsrochsTQw4DI8ZU3tmeRxsEteITxj8BLb4pQTvRlnw=@lists.linux.dev
X-Gm-Message-State: AFuF++kc1cW8a2FlGS83skIOQQtYHSzNpvGf6JFjnc7wspFXjLORR+Il
	mh3QpEKoysWYAhv+w9md77S82qaSqZGtr2ilNNuo6NsixEJq4kiOkcGZ2dB4PRuVsmc=
X-Gm-Gg: AYBFou0471lgTm5p6fcKeXLwbByzlJQruJQgtkvcYpfVffP6bjfsCklVC0ILnahpUad
	w6wdW2r/bwsXuunIl9YzMVaEuWpEf6FPUZPtRuZQcbTC2udygLXsXEV70lN5HBgq4Tu7PReVBle
	8I1q11rJyluShdjNpDuwVOlJZgcg/Vc05U+LQGWVCk5ug3wbgW0vV6BffO2yJ+Ow83lR0oWsTdE
	YSnMZ7/JqO89cUn1Z+v2QotzqoWGjXzIB8gJIRKIq+R+hZM7nrsnbR6xJ/Mg74np9SBec3Z7nLW
	GIvDv4YPiLXSIekAQYi697x5e9BVeHL80OVf3pvAT/xMOpochYu04r8Aon0wpr/nOeKoJ/obGfD
	qn1f3OUCivi2fLReJFWR0PMRWGet0tIJjay+IOJgtwDlYNOCXe60Z8HnqO0H+sP9HwkuHrxf9LX
	5lveww/g7Xi/mc8UklNH2a8L8VHEhos0tF4v/gvkvBDpPwMtMxLlHm7VT2tcwBDB3/zKQOzkim/
	UdYuvElS9k=
X-Received: by 2002:a05:600c:3b0f:b0:49e:7cc2:e6c2 with SMTP id 5b1f17b1804b1-49ff06ed8a4mr87510495e9.27.1790429692711;
        Sat, 26 Sep 2026 06:34:52 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a744fb5sm12791808f8f.33.2026.09.26.06.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:34:52 -0700 (PDT)
Message-ID: <f9e0f1d3-efb3-4c56-8c1c-9a608097c2a3@linaro.org>
Date: Sat, 26 Sep 2026 14:34:49 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/12] dt-bindings: usb: qcom,pmic-typec: Update
 example with vbus-supply
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
 <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The vdd-vbus-supply is deprecated, thus don't suggest deprecated usage in
> example.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index ba790c4488b76..2c8b11e92fb28 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -163,29 +163,30 @@ examples:
>                                 "sig-rx",
>                                 "msg-tx",
>                                 "msg-rx",
>                                 "msg-tx-failed",
>                                 "msg-tx-discarded",
>                                 "msg-rx-discarded",
>                                 "fr-swap";
>   
> -            vdd-vbus-supply = <&pm8150b_vbus>;
>               vdd-pdphy-supply = <&vreg_l2a_3p1>;
>   
>               connector {
>                   compatible = "usb-c-connector";
>   
>                   power-role = "source";
>                   data-role = "dual";
>                   self-powered;
>   
>                   source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
>                                  PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
>   
> +                vbus-supply = <&pm8150b_vbus>;
> +
>                   ports {
>                       #address-cells = <1>;
>                       #size-cells = <0>;
>   
>                       port@0 {
>                           reg = <0>;
>                           pmic_typec_hs_in: endpoint {
>                               remote-endpoint = <&usb_hs_out>;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
