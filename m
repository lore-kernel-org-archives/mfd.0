Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3B3286425
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430058; cv=none; b=JMdP5Jf3UQijpiUSNd9KXRXcK5Ucm2PT4SR0KhBOE3/aUcIwfvTSmRLwHDf3hsBw+hfAR0s08rU4u+3emXQXVDjUBE5BsS+MLnuySKciQCvKBtmps8QgVhQWyqHZdzTkbHr84SXNWV+IrcuI5HCpCijIzB2DDiFPPpaxeCKoCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430058; c=relaxed/simple;
	bh=w6XavIMw57aHLiDolrRY4GGk/U21PS94Ij+L0KosGQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYhjLYtF2IbpQWryhggorYLJ3PzzwX+aQRY9fTjCcok4GL7L8UV7oEk30GNg/ozFbPZxkgLqg68LiAr2FY/pyc1GHSqu7+I8TbI+i/okFu1bX92qHSOycngEa2SIMqHWo8DxOEEHGjALB9neFcqtBUb/b0Tlxf+p/U4v85qXdvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mnt+HS73; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mnt+HS73"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso949278f8f.2
        for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790430055; x=1791034855; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=mnt+HS73bu0qgzxdVFtWJv6FiPJ0S1GPLkpUtf3wsTFXJx3keJbngjUTHyyFXkHFfW
         Gh8dTzuAfvyW44917opYip1Bw+Wb3vZl5j2eKl1SyZXHfSO280wcuJ7i/4D8zjpgLim2
         5waTj41kQK/5o21Tk0dsGZCf2KlRDHg8CT13Efs8D2JbPYAHwel8DOfyi8lfJVikFMII
         F6/x89yr85XzrGMBwyKygQHL82Q4Qvpi8XBvkn690oNQaMAYQ4A9fiBvDKECT4r9gpLW
         KqlPqmrxJwvUq3q+2JqOewbkqw6uSvtLq4wL0iMPBPu4J07BxbEzAXg0hR1lBXItuZ4R
         rAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430055; x=1791034855;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=C3/DopobYxL1jBq0w6J8aVm8KEBcyLSkvwfjxA1SeB2oXUxOQeLXJA453mPzoYemMQ
         1y51EH9Bz/vm2jiLFdv7ovtToQ66fJB5uCWDJCHV7YKASz3GHzbQ50/nPP1BfsrP+hFL
         d/0iy4BicwGDu1HtsufHLCQGZMhzxMkbe6ksAEajMBUoCVhH7CHvjGA58yxthmDJVE/5
         s1K1LYM9GAkIQmnNzf24rfLJz/oPhE8bZ6zB9qHnyMUkVtSvDiAr2uD8nAQpHYai7e5j
         GUYOOEMfcrJcmXUHptTIbe5Ll5ANjAjM/qNfYuYWZpyxHLhLdYkvoH7bsNOBCzo/dpgU
         LzNA==
X-Forwarded-Encrypted: i=1; AKwUvBz1QJjz4HWTkRjKC0GhC4Wc4i8M+sJomt2UHkDXnCfYeFbcwCnGSmwIBXhTJUE/Mz+37oQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLTt13DQyTKQvsyy38JuJxmz0q78am9gQwjsZ3muj4ELaE8WKVz
	ahXYcx6cZnwTI+wzd01AEp62ylnbc3ceTE5uO783rY1CAHAeVO854kUnI1TH+QC1mOo=
X-Gm-Gg: AYBFou37adZvfkVgzdx6s1reIhz51xQj9RFvtU52qShgPUaO/+jG+OQNDp4FwwXhX6b
	DLOs4UpXE/+2pjwZb1vUAa5xlaibCmqmRcPcgyouNCKflfm56CRsoYq7XgiCUube0S/GIG61VsU
	lBy9VDy6UyOKIY5/E7HnShib96AC1HhPAojYAJQ5/xVp88/NKRL8pX+8jaAc3cpJAYn0aRHPb//
	X7Kk/LTZqLg/MnI398fOSnhsiv6/CMYGTyHgJ84irWTXA2oBZjrFVaWuvhkTdRsvu140yM9qWBI
	W1Ob9rnH4v/JXqvNLOjWF+e1QPBPqTLYg0HwZ7b9jFyxnvr+edFIDQq3SEe7EvCRIC6DZv9Cn8g
	KLGBuKNdMBeg8hrbbWQ48jBljJVnuEnh8jAeKfCB5EsWwym2FJdmukNIunK6lDVbON7KfmFXkor
	oFWgdIERoObyYvvyGkR4thdAdt5oI1oX5qDJ0yOqX1qonThvCB4FwTlJnawyfk6XHWBMi5AE1Sn
	W0IChN9OGo=
X-Received: by 2002:a05:6000:2910:b0:488:8987:663b with SMTP id ffacd0b85a97d-48889876a66mr2785861f8f.23.1790430055389;
        Sat, 26 Sep 2026 06:40:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm14660447f8f.12.2026.09.26.06.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:40:54 -0700 (PDT)
Message-ID: <bd0a8dd8-7d0b-441d-9b14-25fb153465db@linaro.org>
Date: Sat, 26 Sep 2026 14:40:53 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/12] usb: typec: qcom: Make typec_port accept also
 different structure
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
 <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is needed by followup commit introducing 1st gen of type-c support.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
Same comment.

Understood its needed but, please describe why. I haven't read the next 
patch yet but I guess you are going to have something other than struct 
pmic_typec_port *

Again a minor nit you an fixup in the next rev

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
