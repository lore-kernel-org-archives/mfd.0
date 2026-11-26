Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715598;
	b=mP67hHtoO/Zm56nbEuxgkhqh59NOCrkbWbltat/1/t0qZKppXjNlhEmK1JSZnfgZ9I3b
	 Jl+TF5+KoJGVjU2Uoxw8PR8BopPJTjlLnl1sUMkYbsl5Dq6/o8uZ9L0JRLaUJocfVydIf
	 feB4f775ed+9WVXkddfvBLKPTyHIbE7jEqboy1BdqO8mJJBUd/wqVyy0dLGlKrzVlkE3N
	 LEQnRNRKTu4oGKrUExfgaM1+nnU5KmflvRypcrHLvMQLHeuqaoILV22OC0jatR+Vtv3NI
	 3YP21YcOGNx6DuwPPdktmZngR0yQzKyIpyD+/p0MoaM8k748K7HvqZybeevT66xxHqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715598;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=/KXAZexVl3utDiHxnh/MFsXIKVO9hpcOSFWA1HjvC64=;
	b=Sm27Gd/9ZYogW0z1Ne/NORitjF0ciYP+XB48yjXNrvHSzXwVKLOFQ9bZgj2HgBFn0M7+
	 iJ2yqo5M+BH4YvVM7dkBl1XRJc4oSYFzBQvib2Qkmb7yJK2XKNaN46hyFK47VR1LIpTOG
	 MFhiPLVfjjSILhXY4UnlrXWXTlNhOnf02AjEfoqxtJc2OA5XGKwxMW5VdnrUYmRaJBp6+
	 B4m/K5pbeol9cxiAX9vo7+l1e6/RCua+VivRTHOvmS/mHs1BShJ7LGpRR+5c/mldmpRS/
	 D9DQuHVMdN9I35KB53DUmuK8WJ/drJO9VANZwZOcLOCBC04thBm3sQ0kCS3cEjeJ5XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kbp0vsa3;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60863606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 17:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60863606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kbp0vsa3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E50101A1824
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 17:53:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B94B760558;
	Thu, 26 Nov 2026 17:53:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AACD411E691A4;
	Thu, 26 Nov 2026 18:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795715592; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/KXAZexVl3utDiHxnh/MFsXIKVO9hpcOSFWA1HjvC64=;
	b=kbp0vsa3q3zacEyZtW1mbQ/6DX1UqhETrVlxikyhVwp9P2r6xyvG42OXQheDqdNQ7RUCwv
	TnIbC7nsluNf5ehhSnwNcl9+cXAPEM0jRfb0UO/fW8Oqqt8ZwrMHeLMISsTkOgxw/MBkEj
	ComCbUDlfIgHu/0etm1exw8KAKR5Te4/LIF4DOzbEl3lTxx8RFVUsX6InsBntqoS67gPIj
	J/OtKnkNOlKxVZKh8082anXUPRtd93XyKKYZWJPpF3Yp8fXfUIXSmjpvmvKNTiBUJtSiES
	Kh800PrW1pG9AjMhhpdyGViJVeTKZTgHgVfvUVdZShTXaw7synHaUQckI7zY3g==
Message-ID: <2f73988d-95b2-40ed-bcd9-c93640d1b296@bootlin.com>
Date: Thu, 26 Nov 2026 18:53:09 +0100
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
Subject: Re: [PATCH v6 10/10] i2c: cgbc: Register known I2C devices on the bus
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lee Jones <lee@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-10-bb070ad3e9aa@bootlin.com>
 <awhwiHGeUFnTvxzg@zenone.zhora.eu>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <awhwiHGeUFnTvxzg@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/26/26 6:47 PM, Andi Shyti wrote:
> Hi Thomas,
> 
> ...
> 
>> @@ -385,7 +385,15 @@ static int cgbc_i2c_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return dev_err_probe(i2c->dev, ret, "Failed to get I2C bus frequency");
>>  
>> -	return i2c_add_numbered_adapter(&i2c->adap);
>> +	ret = i2c_add_numbered_adapter(&i2c->adap);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Add known devices to the bus */
>> +	for (i = 0; i < pdata->nb_devices; i++)
>> +		i2c_new_client_device(&i2c->adap, pdata->devices + i);
> 
> Please handle return values here.
> 
Should the adapter probe return an error if we fail to add a new device
to the bus?

Best Regards,
Thomas
