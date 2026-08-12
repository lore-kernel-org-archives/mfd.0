Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD63E7650
	for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523578; cv=none; b=KLs53KF0Ca59IF813kyH+3nhmBhv2J/K6FP7UXE2epVWl2XrDuI0zQRF6NeJZNnvx+2CucSNrhuRtRVZTNzmODB0gh5DuRYgpTLa9W2+aW409ZPLjdaWZ+XgIbw4uWjOQMJD2+GA/gPZ+IZ8jxX4A6BUfrpzmeZvh9wfPPLlg5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523578; c=relaxed/simple;
	bh=59NaB9DJpc9PT2zjlAZDUJ2PEpr3NRLYiZ77p37FDlc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrPdD+TNUwUeO7rUHNo6fsS6/47gbSNMFnh+JBJOUtry5/y0ZISw5Y/Oc58m9WgXAMnJhf8eEZnV8tml3pY7OrDw7M4n80PyNpwtDQOXe+jUe2Qj9SQeqibtDT8lKkOf23nn3nFtiF/goh+FciCX0+1sBEL3QKlH7ABmmeQsfgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mz3FZnlA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mz3FZnlA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCA11F00A3D
	for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786523577;
	bh=D4fYTkdonNFudLiCicR5+qg8B8A7g4fsWwyZCZbxLtU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mz3FZnlAlLhVB/WJ9Qg7dKjxakVmLaV8ew9S2hp8MF3cmkWSEvZAZF1LRb3c7zfi0
	 CMhBDnYkmmGSipdXihnNyINSLOk4YLqXfIp9WFTWr5ONJgQbVi9Qin5nssZcD7PVor
	 WOKw9zKJcJMu5yjnTNl7eK0apaw1/8HOTyB059JK7Gz52H39JGq1T7cBwgYBS4CFPz
	 S3Pjl7rFGeyqJTOgOdegZkseWnSbbQQ/cR1Sc+SZHVDE4M96bgVioi1O5ihE5ioQYr
	 6z6grfa3kbdcoc1SdsrN1uckjRCNf9Y8n0Ni2AlsE5rV2IV36Pm+7cdf6RQcpww1kX
	 oGvIJiIPqGZ8A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso638541e87.1
        for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 01:32:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpAvE9GAvg5fy8tYqhqtOij8m2DQoMDrKW3Q80swJ9ZmhksTv8GUmXlPIoBaUdujxpwGF0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5U+cP+E1an8BvwJygjBHSUDE3EUevOS7mrT5yfjYrkn4eh/6S
	j58SEWe9qUHLLzxAa6iscqAkKJhBFva5OMvLElwdjuCAR0UqhsvuF9BnNKmv+onKgZHCaULlKhu
	l5yByZFSk7Io1NBdoSWVmgs+BEf1PZoHNylokOgG+og==
X-Received: by 2002:a05:6512:605:20b0:5ae:c454:3746 with SMTP id
 2adb3069b0e04-5b44e315709mr317066e87.43.1786523571645; Wed, 12 Aug 2026
 01:32:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:32:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:32:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260812081856.GF1072730@google.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
 <20260812081856.GF1072730@google.com>
Date: Wed, 12 Aug 2026 01:32:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me7Nua8xgKA43rCH9SV2DQoCyAuOqb+KNDTuPxv_H5y9A@mail.gmail.com>
X-Gm-Features: AUfX_myM-KKHFiWlmkYHiKUnznZQ5Xi8sRhpZ_nwB_pCgToX6LZLHX_mNL9495Y
Message-ID: <CAMRc=Me7Nua8xgKA43rCH9SV2DQoCyAuOqb+KNDTuPxv_H5y9A@mail.gmail.com>
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2026 10:18:56 +0200, Lee Jones <lee@kernel.org> said:
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
>> The PSCI "reboot-mode" node does not define a compatible because it is a
>> configuration of boot-states provided by the underlying firmware. With
>> the new firmware-node based cells in mfd-core, this node can now be
>> exposed as a proper child cell.
>>
>> Add the psci-reboot-mode child cell to the psci-mfd driver with a
>> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
>> reboot-mode failures.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---

...

>> +	if (ret) {
>> +		if (ret == -ENOMEM)
>> +			goto out;
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
>
> Okay Yoda, but why is this okay?
>

Hi Lee,

I'd like to call you out on this because making snarky comments on a non-native
English speaker's syntax is really not OK. Please don't do this. As a native
speaker you could have just proposed a better sounding version.

Thanks,
Bartosz
