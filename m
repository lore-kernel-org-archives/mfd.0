Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702924;
	b=ZfmIzP2BUWxuAlnfDQ76pYg6Cq60U1CGEcTPaud/n/m8HZvtghx0FSUOHtLJ+Lc8DMxM
	 agvVAr3mcX/tz4bNR84vkBMTSYdJXcI60aDj3XneLw3KItxBL7hgM+00erwPDvdxvyrW1
	 Y2/juR3kVJ70pZ3TXsY3Q3ozqJUc6ISQwdcxCzaOCZ1eHm9auJaOEnQTdp139/y2TdktD
	 YlJI+wBBQpb/GLBznXUROAsm6EU2oDiPwW/aVBWv4uO6XpqY3TR9BXftqoMUByJM+6oqg
	 RcBWF+uS9HwqUWju/QqM1F6fjQ+5h8Tnz9/lqR5OctEsmBf+lieWnp1gOWO9CwCFKVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702924;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=OvVAZTz69zThPSa7hVXEpLXSovgpYtvS4X1sc02ssSE=;
	b=u976YQr1DWq8vb4y4pw1Ss2XugwekOuw84wwIhG10eB61OrKdThpO20y4XMZTIC3gsPd
	 gHXzivb598Nzasn1OsHENIKso15Mg4iC9NhEJosQq92HswXToBdGwTaqbdogzS2kaHZGG
	 HcPCKxOVt9CVopo+7kse/igpZ+omKqSQq8QdVEIEjXbncWZpLUC6N8Dkzml1EhUC96xD9
	 JjDkc7OGjIWBUc92jxLpa3AJq/n1YLHdYHwybwAUVYgyXlFL+Ix7ck5vj0njVK2R66PmU
	 c+gyXC0ndkYUiZL8wb5CDFeBjiY5uUrYf2C/flYiTpi8oit7wtT8DKKGtwRiGGVE1Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aoiNvRcF;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9360606A33C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 14:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9360606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aoiNvRcF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CEC14E417A5;
	Thu, 26 Nov 2026 14:22:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12490604ED;
	Thu, 26 Nov 2026 14:22:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E40EE11E68014;
	Thu, 26 Nov 2026 15:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795702917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OvVAZTz69zThPSa7hVXEpLXSovgpYtvS4X1sc02ssSE=;
	b=aoiNvRcF7GPO1yOrbbUy+hL+m8rUvoytuvmFiBT5vnJYRMObC6UfTH103FpcKeZR1yVX7k
	95I57pM030VNwcOYTIv0fXoLgoMK8CzmqBQyOrFDhqfBkDCMQxy5w9H0oGM23ITRIZ4y0e
	K9cckRyHdEX4xPC4iVInYC01liObmgSJALbXyN+HgM59fDbakqFs/NRcfKEZbmaMkYqLho
	hYz4dPbVQTsHFmMUCRGaZn5u8hFDNy6+f9PeZY5UGIBW/clPHiQ1HcZ2wnenJeTIPzMbi4
	dLSTpFpP29mZclQ0zhx6YLTpMIWMhlvpi9fWSFFO6u9ZCg/JZ2NwuF69ekBw/Q==
Message-ID: <79b852d7-13b6-4535-915f-21c992e2ae67@bootlin.com>
Date: Thu, 26 Nov 2026 15:21:50 +0100
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] i2c: cgbc: Use real I2C bus names
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lee Jones <lee@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 stable@vger.kernel.org
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-3-bb070ad3e9aa@bootlin.com>
 <awg2_PLCeNgio_bp@zenone.zhora.eu>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <awg2_PLCeNgio_bp@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/26/26 2:41 PM, Andi Shyti wrote:
> Hi Thomas,
> 
> On Tue, Nov 17, 2026 at 10:47:43AM +0100, Thomas Richard (congatec GmbH) wrote:
>> The adapter names described the expected purpose of the buses ("General
>> Purpose I2C adapter", "Power Management I2C adapter") on conga-sa7 board
>> rather than their actual names on the Board Controller.
>>
>> Rename them to the real bus names "cgbc-i2c0" and "cgbc-ddc0", matching
>> the naming used by Congatec.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 6894f640b8f3 ("i2c: Congatec Board Controller i2c bus driver")
>> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> BTW, do we really need the Fixes tag here and the Cc stable?
Not really, I can remove them.

Best Regards,
Thomas
